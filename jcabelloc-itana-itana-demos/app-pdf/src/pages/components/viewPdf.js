import { React } from "react";
import {
  Button,
  Card,
  CardBody,
  Col,
  Modal,
  ModalBody,
  ModalHeader,
  Row,
} from "reactstrap";

const ViewPdf = ({ isOpenModal, setIsOpenModal, toggle, dataPdf }) => {
  const handleDescargarPdf = async () => {
    const responseArchivo = dataPdf;

    if (responseArchivo) {
      var link = document.createElement("a");
      // Se agregan los prefijos de href para indicar que el contenido que sigue está en formato PDF y 
      // está codificado en Base64.
      link.setAttribute(
        "href",
        "data:application/pdf;base64," + responseArchivo.archivoBase64
      );
      link.setAttribute("download", responseArchivo.archivo);
      link.click();
    }
  };

  return (
    <>
      <Modal isOpen={isOpenModal} toggle={() => toggle()} size="xl">
        <ModalHeader toggle={toggle}>{dataPdf?.nombre}</ModalHeader>
        <ModalBody>
          <Row>
            <Col sm={8} md={7} xl={4} xs={7} className="text-end ms-auto mb-2">
              <Row className="px-2 text-end d-flex justify-content-end">
                <Col
                  lg={2}
                  md={4}
                  sm={2}
                  xs={3}
                  className="p-0 text-end d-flex align-items-center"
                >
                  <label> Descargar: </label>
                </Col>
                <Col lg={2} md={2} sm={2} xs={3} className="p-0">
                  <Button size="sm" color="danger" onClick={handleDescargarPdf}>
                    PDF
                  </Button>
                </Col>
              </Row>
            </Col>
          </Row>
          <Card id="saveEmisor">
            <CardBody className="p-0">
              <Row className="justify-content-center">
                {/* embed Se utiliza para mostrar un pdf el cual no necesita de muchas opciones de personalizacion */}

                <object
                  data={"data:application/pdf;base64," + dataPdf?.archivoBase64}
                  type="application/pdf"
                  width="400"
                  height="750"
                >
                  <p>
                    Tu navegador no puede mostrar este archivo PDF. Puedes
                    descargarlo
                    <a
                      href={
                        "data:application/pdf;base64," + dataPdf?.archivoBase64
                      }
                      download
                    >
                      aquí
                    </a>
                    .
                  </p>
                </object>

                {/* Object e iframe nos permiten mas opciones de personalizacion, 
                    pero puede tener problemas con algunos navegadores antiguos o versiones pasadas*/}

                {/* 
                    <embed src={'data:application/pdf;base64,' + dataPdf?.archivoBase64} 
                            width="400" height="750" >
                    </embed>

                    <object data={'data:application/pdf;base64,' + dataPdf?.archivoBase64} type="application/pdf" 
                            width="400" height="750">
                        <p>Tu navegador no puede mostrar este archivo PDF. Puedes descargarlo 
                        <a href={'data:application/pdf;base64,' + dataPdf?.archivoBase64} download>aquí</a>.</p>
                    </object>

                    <iframe src={'data:application/pdf;base64,' + dataPdf?.archivoBase64} 
                            width="400" height="750">
                    </iframe>
                */}
              </Row>
            </CardBody>
          </Card>
        </ModalBody>
      </Modal>
    </>
  );
};
export default ViewPdf;
