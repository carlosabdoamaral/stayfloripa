import { Accordion } from "react-bootstrap";
import { DefaultAccordionItemPropsI } from "../../models/interfaces/default-accordion-item.props";

export function DefaultAccordionItemComponent(
  props: DefaultAccordionItemPropsI
) {
  return (
    <Accordion.Item eventKey={props.key}>
      <Accordion.Header>{props.header}</Accordion.Header>
      <Accordion.Body>
        {props.list.map((item, i) => (
          <div className="mb-5" key={i}>
            <h6>{item.key}</h6>
            <small>{item.value}</small>
          </div>
        ))}
      </Accordion.Body>
    </Accordion.Item>
  );
}
