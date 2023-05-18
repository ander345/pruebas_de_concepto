import React, { useState } from "react";
import { Button, Spinner } from "reactstrap";
import * as XLSX from "xlsx";

const BotonExcelEstilizado = ({ productos }) => {
  const [loading, setLoading] = useState(false);

  const titulo = [{ A: "Reporte de Productos" }, {}];

  const informacionAdicional = {
    A: "Creado por: iTana el Martes, 04 de Abril del 2023",
  };

  const longitudes = [5, 35, 25, 20, 10, 10, 10];

  const handleDownload = () => {
    setLoading(true);

    let tabla = [
      {
        A: "Id",
        B: "Nombre",
        C: "Marca",
        D: "Categoria",
        E: "Cantidad",
        F: "Precio",
        G: "Valoracion",
      },
    ];

    productos.forEach((producto) => {
      tabla.push({
        A: producto.id,
        B: producto.nombre,
        C: producto.marca,
        D: producto.categoria,
        E: producto.cantidad,
        F: producto.precio,
        G: producto.valoracion,
      });
    });

    const dataFinal = [...titulo, ...tabla, informacionAdicional];

    setTimeout(() => {
      creandoArchivo(dataFinal);
      setLoading(false);
    }, 1000);
  };

  const creandoArchivo = (dataFinal) => {
    const libro = XLSX.utils.book_new();

    const hoja = XLSX.utils.json_to_sheet(dataFinal, { skipHeader: true });

    hoja["!merges"] = [
      XLSX.utils.decode_range("A1:G1"),
      XLSX.utils.decode_range("A2:G2"),
      XLSX.utils.decode_range("A34:G34"),
    ];

    let propiedades = [];

    longitudes.forEach((col) => {
      propiedades.push({
        width: col,
      });
    });

    hoja["!cols"] = propiedades;

    XLSX.utils.book_append_sheet(libro, hoja, "Productos");

    XLSX.writeFile(libro, "ProductosEstilizado.xlsx");
  };

  return (
    <>
      {!loading ? (
        <Button color="success" onClick={handleDownload}>
          Excel Estilizado
        </Button>
      ) : (
        <Button color="success" disabled>
          <Spinner size="sm">Loading...</Spinner>
          <span> Generando...</span>
        </Button>
      )}
    </>
  );
};

export default BotonExcelEstilizado;
