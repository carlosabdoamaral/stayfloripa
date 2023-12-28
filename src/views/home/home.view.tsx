import "./home.view.scss";
import { useState } from "react";
import Carousel from "react-bootstrap/Carousel";
import housesJson from "../../assets/json/data.json";
import { HomeDetailsI } from "../../models/interfaces/home-details";
import { FormatterService } from "../../services/formatter.service";
import { Button } from "react-bootstrap";
import { HomeDetailsModal } from "../../modals/home-details/modal";

export function HomeView() {
  const houses: HomeDetailsI[] = housesJson;

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
  const [offCanvasDetails, setOffCanvasDetails] = useState<HomeDetailsI | null>(
    null
  );

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

  const _formatterService = new FormatterService();

  return (
    <div>
      <Carousel activeIndex={index} onSelect={handleSelect}>
        {houses.map((house: HomeDetailsI, i: number) => (
          <Carousel.Item className="carousel-item" key={i}>
            <div className="carousel-item-wrapper">
              <div className="spacer"></div>
              <div className="title">
                <h1>{house.name}</h1>
                <h5 className="w-50">{_formatterService.toBRL(house.pricePerNight)} por noite</h5>
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

      <HomeDetailsModal
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
    </div>
  );
}
