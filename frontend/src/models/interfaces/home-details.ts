export interface HomeDetailsI {
  id: number;
  name: string;
  pricePerNight: number;
  about: About;
  tags: any[];
  images: any[];
  location: Location;
  rules: Rules;
  responsible: Responsible;
}

interface Responsible {
  name: string;
  email: string;
  phone: string;
  obs: string;
}

interface Rules {
  checkInOut: string[];
  duringStay: DuringStay;
  beforeLeaving: BeforeLeaving;
  cancellationPolicy: any[];
  additional: any[];
  maxGuests: number;
}

interface BeforeLeaving {
  list: string[];
}

interface DuringStay {
  list: string[];
  forbidden: string[];
}

interface Location {
  cep: string;
  neighborhood: string;
  address: string;
  lat: string;
  lng: string;
  iframeSource: string;
}

interface About {
  general: string;
  space: string;
  guestAccess: string;
  other: string;
  count: Count;
}

interface Count {
  bedrooms: number;
  bed: number;
  bathroom: number;
}
