import moment from "moment";
import { HouseDetailsProps } from "../components/house-details/house-details";
import { CalcRentPrice } from "./calc-rent-price";
import { DateFormats } from "../enums/date";

export enum RentMessageTypes {
  PHONE,
  EMAIL,
}

export function HandleSendRentMessage(
  type: RentMessageTypes,
  props: HouseDetailsProps
) {
  if (!props.name || !props.startDate || !props.endDate || !props.guestCount) {
    console.log("Erro");
    return;
  }

  let amount = CalcRentPrice(props);
  props.setFinalValue(amount);

  let message = `
  Olá ${props.house?.responsible.name}, me chamo ${props.name}.\n
  Tenho interesse em alugar o imóvel *${props.house!.name} nos dias ${moment(
    props.startDate
  ).format(DateFormats.DATE)} até ${moment(props.endDate).format(
    DateFormats.DATE
  )}.\n
  Estarei com ${props.guestCount} pessoas.\n
  O valor final calculado é ${amount}.\n
  Além disso gostaria de deixar essas observações: ${props.notes}`;

  if (type === RentMessageTypes.EMAIL) {
    window.location.href = `mailto:${props.house?.responsible.email}?subject=Aluguel de imóvel&body=${message}`;
    return;
  }
  if (type === RentMessageTypes.PHONE) {
    window.location.href = `https://wa.me//${props.house?.responsible.phone}?text=${message}`;
    return;
  }
}
