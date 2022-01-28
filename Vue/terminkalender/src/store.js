import { calenderWeekData } from "@/data";

export const store = {
    state: {
        calenderWeekData
    },
    getActiveDay() {
        return this.state.calenderWeekData.find(day => day.active);
    },
    setActiveDay(dayId) {
        this.state.calenderWeekData.map(dayObj => {
            dayObj.id === dayId ? dayObj.active = true : dayObj.active = false;
        });
    },
    storeEvent(eventTitle, eventColor) {
        const activeDay = this.getActiveDay();
        activeDay.events.push({'title': eventTitle, 'edit': false, 'color': eventColor});
    },
    editEvent(dayId, eventTitle) {
        this.resetEditOfAllEvents();
        const dayObj = this.state.calenderWeekData.find(day => day.id === dayId);
        const eventObj = dayObj.events.find(event => event.title === eventTitle);
        eventObj.edit = true;
    },
    resetEditOfAllEvents() {
        this.state.calenderWeekData.map(dayObj => {
            dayObj.events.map ( event => {
                event.edit = false;
            })
        })
    },
    setEventTitle(dayId, eventTitle, newEventTitle) {
        const dayObj = this.state.calenderWeekData.find(day => day.id === dayId);
        const eventObj = dayObj.events.find(event => event.title === eventTitle);
        eventObj.title = newEventTitle;
        eventObj.edit = false;
    },
    deleteEvent(dayId, eventTitle) {
        const dayObj = this.state.calenderWeekData.find(day => day.id === dayId);
        const eventIndex = dayObj.events.findIndex(event => event.title === eventTitle);
        dayObj.events.splice(eventIndex, 1);
    },
    deleteAllEvents() {
        const weekObj = this.state.calenderWeekData;
        for (const day in weekObj) {
            weekObj[day].events = [];
        }
    }
}
