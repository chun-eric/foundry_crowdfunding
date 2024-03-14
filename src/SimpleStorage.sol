// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity versions

contract SimpleStorage {
    uint256 public favoriteNumber; // defaults to 0

    struct Person {
        uint256 personFavoriteNumber;
        string personName;
    }

    // Person public person1 = Person({personFavoriteNumber: 8, personName: "Steve"});

    // Dynamic Array
    Person[] public listOfPeople;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(
        uint256 _personFavoriteNumber,
        string memory _personName
    ) public {
        listOfPeople.push(Person(_personFavoriteNumber, _personName));
    }
}
