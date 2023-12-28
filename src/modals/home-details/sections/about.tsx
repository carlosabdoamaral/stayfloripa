import { HomeDetailsModalPropsI } from "../../../models/interfaces/home-details-modal.props";
import { DefaultAccordionItemComponent } from "../../../components/default-accordion-item-component/default-accordion-item.component";

export function HomeDetailsModalAboutSection(props: HomeDetailsModalPropsI) {
  const details = [
    {
      key: "",
      value: props.house!.about.general,
    },
    {
      key: "O espaço",
      value: props.house!.about.space,
    },
    {
      key: "Acesso ao hóspede",
      value: props.house!.about.guestAccess,
    },
    {
      key: "Observações",
      value: props.house!.about.other,
    },
  ];

  return (
    <>
      {DefaultAccordionItemComponent({
        key: "about",
        header: "Sobre",
        list: details,
      })}
    </>
  );
}
