import { Accordion, Modal, ToastContainer } from "react-bootstrap";
import { HomeDetailsModalPropsI } from "../../models/interfaces/home-details-modal.props";
import { HomeDetailsModalAboutSection } from "./sections/about";
import { HomeDetailsModalLocationSection } from "./sections/location";
import { HomeDetailsModalRentSection } from "./sections/rent";
import { HomeDetailsModalRulesSection } from "./sections/rules";
import "./home-details-modal.scss";

export function HomeDetailsModal(props: HomeDetailsModalPropsI) {
  return (
    <>
      <ToastContainer />

      {!!props.house ? (
        <Modal
          size="lg"
          className="my-2"
          show={props.show}
          onHide={() => {
            props.onHide();
          }}
        >
          <Modal.Header closeButton>
            <Modal.Title>
              <h4>{props.house.name}</h4>
            </Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Accordion defaultActiveKey="about">
              {HomeDetailsModalAboutSection(props)}
              {HomeDetailsModalLocationSection(props)}
              {HomeDetailsModalRulesSection(props)}
              {HomeDetailsModalRentSection(props)}
            </Accordion>
          </Modal.Body>
        </Modal>
      ) : (
        <></>
      )}
    </>
  );
}
