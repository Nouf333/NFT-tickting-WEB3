
pragma solidity ^0.4.24;

contract Event{

    struct EventData{
        // string name of the event
        string name;
        // face value price of tickets (in wei)
        uint price;
        // total number of tickets offered
        uint totalTickets;
        // number of tickets remaining
        uint remainingTickets;
        // owner address of the event
        address owner;
    }

    // All events
    EventData[] public events;
    
    // Called each time an event is created 
    event EventCreated(uint indexed eventId, address indexed creator);

    function createEvent(string name, uint price, uint totalTickets)  returns (uint) {
        uint id = events.push(EventData(name, price, totalTickets, totalTickets, msg.sender)) - 1;
        emit EventCreated(id, msg.sender);
        return id;
    }
}