import { Form, InputGroup } from "react-bootstrap";
import "../../assets/styles/find-view.scss";

export function FindView() {
  return (
    <div className="find-wrapper w-75">
      <div className="title">
        <h1>StayFloripa.</h1>
        <small>Casas familiares</small>
      </div>

      {/* <Form.Control
        type="text"
        className="w-50"
        placeholder="Onde você quer ficar?"
      /> */}

      <InputGroup className="w-50 default-input">
        <Form.Control placeholder="Onde você quer ficar?" />
        <InputGroup.Text>
          <span className="material-symbols-outlined">search</span>
        </InputGroup.Text>
      </InputGroup>
    </div>
  );
}
