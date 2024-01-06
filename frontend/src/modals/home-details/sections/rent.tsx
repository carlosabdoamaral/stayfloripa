import { Accordion, Button, Col, Container, Row } from "react-bootstrap";
import { Form } from "react-bootstrap";
import { HomeDetailsModalPropsI } from "../../../models/interfaces/home-details-modal.props";
import { RentContactTypes } from "../../../models/interfaces/rent-contact-types";
import { RentService } from "../../../services/rent.service";
import { RenderFieldProps } from "../../../models/interfaces/home-details-modal-rent.props";
import { DateFormats } from "../../../models/enums/date";
import moment from "moment";

export function HomeDetailsModalRentSection(props: HomeDetailsModalPropsI) {
  const _service = new RentService();

  const renderField = (props: RenderFieldProps) => {
    return (
      <Form.Group className="mb-3">
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
  };

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
      <Form.Group className="mb-3">
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

                if (!!e.target.value && !!props.endDate) {
                  const finalValue = _service.calcFinalValue({
                    startDate: new Date(e.target.value),
                    endDate: new Date(props.endDate),
                    pricePerNight: props.house?.pricePerNight,
                  });

                  props.setFinalValue(finalValue);
                } else {
                  props.setFinalValue("Selecione as datas para calcular");
                }
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

                if (!!e.target.value && !!props.startDate) {
                  const finalValue = _service.calcFinalValue({
                    startDate: new Date(props.startDate),
                    endDate: new Date(e.target.value),
                    pricePerNight: props.house?.pricePerNight,
                  });

                  props.setFinalValue(finalValue);
                } else {
                  props.setFinalValue("Selecione as datas para calcular");
                }
              },
            } as RenderFieldProps)}
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
      <Form.Group className="mb-3">
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
        <Form
          onSubmit={(e) => {
            e.preventDefault();
            _service.sendMessage(RentContactTypes.PHONE, props);
          }}
        >
          {renderAboutYouFields()}
          <Container className="my-5" />
          {renderAboutRentFields()}
          <Container className="my-5" />
          {renderNotesField()}

          <Row>
            <Col>
              <Button
                type={"button"}
                className={`clear-btn w-100`}
                onClick={() => {
                  props.handleClear();
                }}
              >
                <p>Limpar</p>
              </Button>
            </Col>
            <Col>
              <Button type={"submit"} className={`whatsapp-btn w-100`}>
                <p>Conversar no whatsapp</p>
              </Button>
            </Col>
          </Row>
        </Form>
      </Accordion.Body>
    </Accordion.Item>
  );
}
