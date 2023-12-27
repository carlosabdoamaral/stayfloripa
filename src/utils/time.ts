import moment, { Duration } from "moment";
import { DateFormats } from "../enums/date";

export const twoHours = 120;
export const hourAndHalf = 90;

export function getDiffInMinutes(startTime: string, endTime: string): number {
  const startTimeFormatted = moment(startTime, DateFormats.TIME_EXTENDED);
  const endTimeFormatted = moment(endTime, DateFormats.TIME_EXTENDED);

  const msDiff: number = startTimeFormatted.diff(endTimeFormatted);
  const date: Duration = moment.duration(msDiff);
  const minutes: number = date.asMinutes() * -1;

  return minutes;
}

export function getDiffInHours(startTime: string, endTime: string): string {
  const startTimeFormatted = moment(startTime, DateFormats.TIME_EXTENDED);
  const endTimeFormatted = moment(endTime, DateFormats.TIME_EXTENDED);

  const msDiff: number = startTimeFormatted.diff(endTimeFormatted);
  const date: Duration = moment.duration(msDiff);
  const diffMinutes: number = date.asMinutes() * -1;

  return `${Math.floor(diffMinutes / 60)}h${diffMinutes % 60}m`;
}

export function getDaysDiff(startDate: string, endDate: string): number {
  const _start = moment(startDate);
  const _end = moment(endDate);

  const duration = moment.duration(_start.diff(_end));
  const days = duration.asDays();

  if (days < 0) return days * -1;
  else return days;
}
