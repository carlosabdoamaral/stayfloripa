import { Accordion } from "react-bootstrap";
import { HouseDetailsProps } from "./house-details";

export function renderAboutSection(props: HouseDetailsProps) {
  const details = [
    {
      key: "",
      value: props.house!.about.general,
    },
    {
      key: "O espaço",
      value: props.house!.about.space,
    },
    {
      key: "Acesso ao hóspede",
      value: props.house!.about.guestAccess,
    },
    {
      key: "Observações",
      value: props.house!.about.other,
    },
  ];

  return (
    <Accordion.Item eventKey={"about"}>
      <Accordion.Header>Sobre</Accordion.Header>
      <Accordion.Body>
        {details.map((item, i) => (
          <div className="mb-5" key={i}>
            <h6>{item.key}</h6>
            <small>{item.value}</small>
          </div>
        ))}
      </Accordion.Body>
    </Accordion.Item>
  );
}
