import { HomeDetailsI } from "./home-details";

export interface HomeDetailsModalPropsI {
  house: HomeDetailsI | null;
  show: boolean;
  onHide: Function;

  name: string;
  setName: Function;

  email: string;
  setEmail: Function;

  startDate: string;
  setStartDate: Function;

  endDate: string;
  setEndDate: Function;

  guestCount: number;
  setGuestCount: Function;

  notes: string;
  setNotes: Function;

  finalValue: string;
  setFinalValue: Function;

  handleClear: Function;
}
