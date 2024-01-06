import { ChangeEventHandler } from "react";

export interface RenderFieldProps {
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

export interface RenderButtonProps {
  className: string;
  text: string;
  icon: any;
  img: any;
  onClick: Function | null;
  type: "button" | "submit" | "reset" | undefined;
}
