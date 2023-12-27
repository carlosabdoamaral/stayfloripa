import { GoogleMap, useLoadScript, Marker } from "@react-google-maps/api";

const libraries: any = [];
const mapContainerStyle = {
  width: "100%",
  height: "300px",
};
const center = {
  lat: 7.2905715, // default latitude
  lng: 80.6337262, // default longitude
};

export const CustomMap = () => {
  const { isLoaded, loadError } = useLoadScript({
    googleMapsApiKey: "YOUR_API_KEY",
    libraries,
  });

  if (loadError) {
    return <div>Error loading maps</div>;
  }

  if (!isLoaded) {
    return <div>Loading maps</div>;
  }

  return (
    <div>
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        zoom={10}
        center={center}
      >
        <Marker position={center} />
      </GoogleMap>
    </div>
  );
};
