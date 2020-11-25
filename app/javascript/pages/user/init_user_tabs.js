const symptomsTab = document.querySelector("#symptoms")
const prescriptionsTab = document.querySelector("#prescriptions")
const appointmentsTab = document.querySelector("#appointments")

const initUserTabs = () => {
  const userTabsLinks = document.querySelectorAll(".user-tab")
  userTabsLinks.forEach((btn) => {

    btn.addEventListener("click", (event) => {
      const ulTarget = event.target.dataset.target
      userTabsLinks.forEach((btn2) => {
        btn2.style.color="black"
      })
      if (ulTarget === "symptoms") {
        symptomsTab.classList.add("active")
        prescriptionsTab.classList.remove("active")
        appointmentsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      } else if (ulTarget === "prescriptions") {
        prescriptionsTab.classList.add("active")
        symptomsTab.classList.remove("active")
        appointmentsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      } else {
        appointmentsTab.classList.add("active")
        symptomsTab.classList.remove("active")
        prescriptionsTab.classList.remove("active")
        event.target.style.color="rgb(248, 171, 65)"
      }
    })
  })
}

export { initUserTabs };
