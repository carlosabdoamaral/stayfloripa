import moment from "moment";

export class TimeService {
  getDaysDiff(startDate: Date, endDate: Date): number {
    const _start = moment(startDate);
    const _end = moment(endDate);

    const duration = moment.duration(_start.diff(_end));
    const days = duration.asDays();

    if (days < 0) return days * -1;
    else return days;
  }
}
