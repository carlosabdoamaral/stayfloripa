import { Accordion, ListGroup } from "react-bootstrap";
import { HomeDetailsModalPropsI } from "../../../models/interfaces/home-details-modal.props";

export function HomeDetailsModalRulesSection(props: HomeDetailsModalPropsI) {
  function renderList(
    items: string[],
    iconName: string | null,
    colorHex: string,
    variant: string | null = null
  ) {
    return items.map((item, i) => (
      <ListGroup.Item
        className="d-flex justify-content-between align-items-start"
        variant={variant ?? ""}
        key={i}
      >
        <div className="d-flex justify-content-between align-items-center">
          {iconName && (
            <span
              style={{ color: colorHex }}
              className="material-symbols-outlined me-2"
            >
              {iconName}
            </span>
          )}
          <small>{item}</small>
        </div>
      </ListGroup.Item>
    ));
  }

  return (
    <Accordion.Item eventKey={"rules"}>
      <Accordion.Header>Regras</Accordion.Header>
      <Accordion.Body>
        <div>
          <h5>Check-in & Check-out</h5>
          <ListGroup>
            {renderList(props.house!.rules.checkInOut, null, "#294090")}
          </ListGroup>
        </div>

        <hr className="my-5" />

        <div>
          <h5>Durante a estadia</h5>
          <ListGroup as="ol">
            {renderList(props.house!.rules.duringStay.list, null, "#294090")}
          </ListGroup>
          <br />
          <ListGroup as="ol">
            {renderList(
              props.house!.rules.duringStay.forbidden,
              "",
              "#E01D1D ",
              "danger"
            )}
          </ListGroup>
        </div>

        <hr className="my-5" />

        <div>
          <h5>Antes de sair</h5>
          <ListGroup as="ol">
            {renderList(props.house!.rules.beforeLeaving.list, null, "#294090")}
          </ListGroup>
        </div>
      </Accordion.Body>
    </Accordion.Item>
  );
}
