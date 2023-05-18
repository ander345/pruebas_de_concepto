import { React, useState, useEffect } from "react";
import { Card, CardBody, CardTitle, Button } from "reactstrap";
import ViewPdf from "./components/viewPdf";
import documentService from "./services/documentService";

const CardPdf = () => {
  const [isOpenModalPdf, setIsOpenModalPdf] = useState(false);
  const [dataPdf, setDataPdf] = useState();
  const [cargando, setCargando] = useState(false);

  useEffect(() => {
    setCargando(true);

    //Simulacion del tiempo de respuesta de una API
    setTimeout(() => {
      const responseDataPdf = documentService();
      setDataPdf(responseDataPdf);
      setCargando(false);
    
    }, 3000);
  }, []);

  const toggleModalPdf = () => setIsOpenModalPdf(!isOpenModalPdf);

  return (
    <div className="d-flex justify-content-center align-items-center vh-100">
      <ViewPdf
        isOpenModal={isOpenModalPdf}
        setIsOpenModal={setIsOpenModalPdf}
        toggle={toggleModalPdf}
        dataPdf={dataPdf}
      />

      <Card>
        <CardBody>
          <CardTitle className="text-center">PDF</CardTitle>
          <div className="d-flex justify-content-between">
            {
              cargando ? (<p>Cargando datos ...</p>) :
              (
                <Button color="primary" onClick={toggleModalPdf}>
                  Ver PDF
                </Button>
              )
            }
          </div>
        </CardBody>
      </Card>
    </div>
  );
};

export default CardPdf;
