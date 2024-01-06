import moment from "moment";
import { DateFormats } from "../models/enums/date";
import { HomeDetailsModalPropsI } from "../models/interfaces/home-details-modal.props";
import { RentContactTypes } from "../models/interfaces/rent-contact-types";
import { FormatterService } from "./formatter.service";
import { TimeService } from "./time.service";
import { toast } from "react-toastify";

export class RentService {
  calcFinalValue(props: {
    startDate: Date;
    endDate: Date;
    pricePerNight: number | undefined;
  }) {
    if (!props.startDate || !props.endDate) {
      return "Selecione as datas para calcular";
    }

    const _timeService = new TimeService();
    const _formatterService = new FormatterService();

    let daysCount = _timeService.getDaysDiff(props.startDate, props.endDate);
    let totalPrice = props.pricePerNight! * daysCount;
    return _formatterService.toBRL(totalPrice);
  }

  sendMessage(type: RentContactTypes, props: HomeDetailsModalPropsI) {
    if (
      !props.name ||
      !props.startDate ||
      !props.endDate ||
      !props.guestCount
    ) {
      return;
    }

    let amount = this.calcFinalValue({
      startDate: new Date(props.startDate),
      endDate: new Date(props.endDate),
      pricePerNight: props.house!.pricePerNight,
    });
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

    console.log("Here");
    if (type === RentContactTypes.EMAIL) {
      window.location.href = `mailto:${props.house?.responsible.email}?subject=Aluguel de imóvel&body=${message}`;
      return;
    }
    if (type === RentContactTypes.PHONE) {
      window.location.href = `https://wa.me//${props.house?.responsible.phone}?text=${message}`;
      return;
    }
  }
}
