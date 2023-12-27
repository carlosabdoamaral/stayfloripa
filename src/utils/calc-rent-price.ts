import { getDaysDiff } from "./time";
import { HouseDetailsProps } from "../components/house-details/house-details";

export function toBRL(amount: number): string {
  return amount.toLocaleString("pt-br", { style: "currency", currency: "BRL" });
}

export function CalcRentPrice(props: HouseDetailsProps) {
  if (!props.startDate || !props.endDate) {
    return "Selecione as datas para calcular";
  }

  let daysCount = getDaysDiff(props.startDate, props.endDate);
  let totalPrice = props.house!.pricePerNight * daysCount;
  return toBRL(totalPrice);
}
