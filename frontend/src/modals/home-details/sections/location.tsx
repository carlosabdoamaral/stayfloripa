import Iframe from "react-iframe";
import { HomeDetailsModalPropsI } from "../../../models/interfaces/home-details-modal.props";
import { Accordion } from "react-bootstrap";

export function HomeDetailsModalLocationSection(props: HomeDetailsModalPropsI) {
  const details = [
    {
      key: "Endereço",
      value: props.house!.location.address,
    },
  ];

  return (
    <>
      <Accordion.Item eventKey={"location"}>
        <Accordion.Header>Localização</Accordion.Header>
        <Accordion.Body>
          {details.map((item, i) => (
            <div className="mb-5" key={i}>
              <h6>{item.key}</h6>
              <small>{item.value}</small>
            </div>
          ))}

          <div className="mb-5">
            <h6>Mapa</h6>
            <Iframe
              url={props.house!.location.iframeSource}
              width="100%"
              height="320px"
              id=""
              className=""
              display="block"
              position="relative"
            />
          </div>
        </Accordion.Body>
      </Accordion.Item>
    </>
  );
}
