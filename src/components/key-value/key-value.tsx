import { Container } from "react-bootstrap";

export interface KeyValueI {
  key: string;
  value: string;
}

export function KeyValue(props: KeyValueI) {
  return (
    <Container>
      <h1>{props.key}</h1>
      <small>{props.value}</small>
    </Container>
  );
}
