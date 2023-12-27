import "../../assets/styles/home-view.scss";
import { useState } from "react";
import Carousel from "react-bootstrap/Carousel";
import housesJson from "../../assets/json/houses.json";
import { Button } from "react-bootstrap";
import { HouseDetails } from "../../components/house-details/house-details";
import { HouseDetailsI } from "../../interfaces/house-details";
import { toBRL } from "../../utils/calc-rent-price";

export function HomeView() {
  const houses: HouseDetailsI[] = housesJson;

  const [name, setName] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [startDate, setStartDate] = useState<string>("");
  const [endDate, setEndDate] = useState<string>("");
  const [guestCount, setGuestCount] = useState<number>(1);
  const [notes, setNotes] = useState<string>("");
  const [finalValue, setFinalValue] = useState<string>(
    "Selecione as datas para calcular"
  );

  const handleClear = () => {
    setName("");
    setEmail("");
    setStartDate("");
    setEndDate("");
    setGuestCount(1);
    setNotes("");
    setFinalValue("Selecione as datas para calcular");
  };

  const [mustShowOffCanvas, setMustShowOffCanvas] = useState<boolean>(false);
  const [offCanvasDetails, setOffCanvasDetails] =
    useState<HouseDetailsI | null>(null);

  const [index, setIndex] = useState<number>(0);
  const handleSelect = (selectedIndex: any) => {
    setIndex(selectedIndex);
  };

  const handleOpenDetails = (details: any) => {
    handleClear();
    setOffCanvasDetails(details);
    setMustShowOffCanvas(true);
  };

  const handleClose = () => {
    handleClear();
    setMustShowOffCanvas(false);
    setOffCanvasDetails(null);
  };

  return (
    <>
      <Carousel activeIndex={index} onSelect={handleSelect}>
        {houses.map((house: HouseDetailsI, i: number) => (
          <Carousel.Item className="carousel-item" key={i}>
            <div className="carousel-item-wrapper">
              <div className="spacer"></div>
              <div className="title">
                <h1>{house.name}</h1>
                <h5 className="w-50">{toBRL(house.pricePerNight)} por noite</h5>
              </div>
              <div className="spacer"></div>
              <Button
                className="cell-button mt-3 mb-5"
                variant="light"
                onClick={() => {
                  handleOpenDetails(house);
                }}
              >
                Ver detalhes
              </Button>
            </div>
          </Carousel.Item>
        ))}
      </Carousel>

      <HouseDetails
        name={name}
        setName={setName}
        email={email}
        setEmail={setEmail}
        startDate={startDate}
        setStartDate={setStartDate}
        endDate={endDate}
        setEndDate={setEndDate}
        guestCount={guestCount}
        setGuestCount={setGuestCount}
        notes={notes}
        setNotes={setNotes}
        finalValue={finalValue}
        setFinalValue={setFinalValue}
        house={offCanvasDetails}
        show={mustShowOffCanvas}
        onHide={handleClose}
        handleClear={handleClear}
      />
    </>
  );
}
