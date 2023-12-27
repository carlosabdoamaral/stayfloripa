import { HouseDetailsI } from "../../interfaces/house-details";
import { Accordion, Modal } from "react-bootstrap";
import { renderAboutSection } from "./about";
import { renderLocationSection } from "./location";
import { renderRulesSection } from "./rules";
import { renderRentSection } from "./rent";
import "../../assets/styles/house-details-component.scss";

export interface HouseDetailsProps {
  house: HouseDetailsI | null;
  show: boolean;
  onHide: Function;

  name: string;
  setName: Function;

  email: string;
  setEmail: Function;

  startDate: string;
  setStartDate: Function;

  endDate: string;
  setEndDate: Function;

  guestCount: number;
  setGuestCount: Function;

  notes: string;
  setNotes: Function;

  finalValue: string;
  setFinalValue: Function;

  handleClear: Function;
}

export function HouseDetails(props: HouseDetailsProps) {
  function getDetailsToRender() {
    if (!props.house) return;
    return [
      renderAboutSection(props),
      renderLocationSection(props),
      renderRulesSection(props),
      renderRentSection(props),
    ];
  }

  return (
    <>
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
              {getDetailsToRender()}
            </Accordion>
          </Modal.Body>
        </Modal>
      ) : (
        <></>
      )}
    </>
  );
}
