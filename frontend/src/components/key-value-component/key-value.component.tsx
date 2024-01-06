import "./component.scss";

export function KeyValueComponent(props: { key: string; value: string }) {
  return (
    <div>
      <div>{props.key}</div>
      <div>{props.value}</div>
    </div>
  );
}
