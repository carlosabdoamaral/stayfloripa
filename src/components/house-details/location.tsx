import { Accordion } from "react-bootstrap";
import { HouseDetailsProps } from "./house-details";
import { CustomMap } from "../custom-map/custom-map";

export function renderLocationSection(props: HouseDetailsProps) {
  const details = [
    {
      key: "Endereço",
      value: props.house!.location.address,
    },

    {
      key: "Bairo",
      value: props.house!.location.neighborhood,
    },
  ];

  return (
    <Accordion.Item eventKey={"location"}>
      <Accordion.Header>Localização</Accordion.Header>
      <Accordion.Body>
        {details.map((item, i) => (
          <div className="mb-5" key={i}>
            <h6>{item.key}</h6>
            <small>{item.value}</small>
          </div>
        ))}
        <CustomMap />
      </Accordion.Body>
    </Accordion.Item>
  );
}
