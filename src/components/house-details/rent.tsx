import { Accordion, Button, Col, Container, Row } from "react-bootstrap";
import { HouseDetailsProps } from "./house-details";
import whatsappIcon from "../../assets/icons/whatsapp_ic.svg";
import { Form } from "react-bootstrap";
import { ChangeEventHandler } from "react";
import {
  HandleSendRentMessage,
  RentMessageTypes,
} from "../../utils/handle-submit";
import moment from "moment";
import { DateFormats } from "../../enums/date";
import { CalcRentPrice } from "../../utils/calc-rent-price";

interface RenderFieldProps {
  type: string;
  placeholder: string;
  label: string;
  value: any;
  disabled: boolean;
  required: boolean;
  onChange: ChangeEventHandler<any>;
  max: string | number | undefined;
  min: string | number | undefined;
}

interface RenderButtonProps {
  className: string;
  text: string;
  icon: any;
  img: any;
  onClick: Function | null;
  type: "button" | "submit" | "reset" | undefined;
}

function RentActionButton(props: RenderButtonProps) {
  return (
    <Button
      type={props.type}
      className={`${props.className} w-100`}
      onClick={() => {
        if (props.onClick) props.onClick();
      }}
    >
      {!!props.img ? (
        <img src={props.img} alt="" />
      ) : (
        <span className="material-symbols-outlined">{props.icon}</span>
      )}
      <p>{props.text}</p>
    </Button>
  );
}

export function renderRentSection(props: HouseDetailsProps) {
  function renderField(props: RenderFieldProps) {
    return (
      <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
        <Form.Label>
          <small className="text-muted">{props.label}</small>
        </Form.Label>

        <Form.Control
          value={props.value}
          type={props.type}
          placeholder={props.placeholder}
          disabled={props.disabled}
          onChange={props.onChange}
          max={props.max}
          min={props.min}
          required={props.required}
        />
      </Form.Group>
    );
  }

  function renderAboutYouFields() {
    return (
      <>
        <h6>Sobre você</h6>
        {renderField({
          type: "text",
          placeholder: "Seu nome...",
          label: "Nome*",
          value: props.name,
          disabled: false,
          required: true,
          onChange: (e) => {
            props.setName(e.target.value);
          },
        } as RenderFieldProps)}

        {renderField({
          type: "email",
          placeholder: "Email@exemplo.com",
          label: "Email",
          value: props.email,
          disabled: false,
          required: false,
          onChange: (e) => {
            props.setEmail(e.target.value);
          },
        } as RenderFieldProps)}
      </>
    );
  }

  function renderAboutRentFields() {
    return (
      <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
        <h6>Sobre a estadia</h6>
        <Row className="mb-3">
          <Col>
            {renderField({
              type: "number",
              placeholder: "",
              label: `Número de hóspedes (1 - ${
                props.house!.rules.maxGuests
              })*`,
              value: props.guestCount,
              disabled: false,
              required: true,
              onChange: (e) => {
                if (e.target.value >= props.house!.rules.maxGuests) {
                  props.setGuestCount(props.house!.rules.maxGuests);
                } else if (e.target.value < 0) {
                  props.setGuestCount(1);
                } else {
                  props.setGuestCount(e.target.value);
                }
              },
              max: props.house?.rules.maxGuests,
              min: 1,
            } as RenderFieldProps)}
          </Col>
        </Row>

        <Row className="mb-3">
          <Col>
            {renderField({
              type: "date",
              placeholder: "",
              label: "Check-in*",
              value: props.startDate,
              disabled: false,
              required: true,
              min: moment(new Date()).format(DateFormats.YYYYY_MM_DD),
              max: props.endDate
                ? moment(props.endDate).format(DateFormats.YYYYY_MM_DD)
                : "",
              onChange: (e) => {
                props.setStartDate(e.target.value);
              },
            } as RenderFieldProps)}
          </Col>
          <Col>
            {renderField({
              type: "date",
              placeholder: "",
              label: "Check-out*",
              value: props.endDate,
              disabled: false,
              required: true,
              min: props.startDate
                ? moment(props.startDate).format(DateFormats.YYYYY_MM_DD)
                : moment(new Date()).format(DateFormats.YYYYY_MM_DD),
              onChange: (e) => {
                props.setEndDate(e.target.value);
              },
            } as RenderFieldProps)}
          </Col>

          <Col xs={3}>
            <Form.Group>
              <Form.Label>
                <small className="text-muted">Ação</small>
              </Form.Label>
            </Form.Group>
            <Button
              className="w-100"
              variant="dark"
              onClick={() => {
                let res = CalcRentPrice(props);
                props.setFinalValue(res);
              }}
            >
              Calcular
            </Button>
          </Col>
        </Row>

        <Row>
          <Col>
            {renderField({
              type: "text",
              placeholder: "",
              label: "Valor final",
              value: props.finalValue,
              disabled: true,
            } as RenderFieldProps)}
          </Col>
        </Row>
      </Form.Group>
    );
  }

  function renderNotesField() {
    return (
      <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
        <h6>Observações</h6>

        <Form.Control
          as="textarea"
          rows={3}
          value={props.notes}
          onChange={(ev) => {
            props.setNotes(ev.target.value);
          }}
        />
      </Form.Group>
    );
  }

  return (
    <Accordion.Item eventKey={"rent"}>
      <Accordion.Header>Alugar</Accordion.Header>
      <Accordion.Body>
        <Form>
          {renderAboutYouFields()}
          <Container className="my-5" />
          {renderAboutRentFields()}
          <Container className="my-5" />
          {renderNotesField()}
        </Form>

        <Row>
          <Col>
            <RentActionButton
              className={"email-btn"}
              text={"Enviar email"}
              icon={"mail"}
              img={null}
              type="button"
              onClick={() => {
                HandleSendRentMessage(RentMessageTypes.EMAIL, props);
              }}
            />
          </Col>
          <Col>
            <RentActionButton
              className={"whatsapp-btn"}
              text={"Enviar mensagem"}
              icon={null}
              img={whatsappIcon}
              type="submit"
              onClick={() => {
                HandleSendRentMessage(RentMessageTypes.PHONE, props);
              }}
            />
          </Col>
        </Row>
      </Accordion.Body>
    </Accordion.Item>
  );
}
