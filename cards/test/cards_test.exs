defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck" do
    assert Cards.create_deck() == ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades", "Five of Spades", "Ace of Hearts", "Two of Hearts", "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs", "Five of Clubs", "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
  end

  test "create deck makes 20 cards" do
    assert length(Cards.create_deck()) == 20
  end 
  test "contains returns true when its member" do
    assert Cards.contains?(["Ace","Two", "Three"], "Two") == true
  end

  test "contains returns false when its not a member" do
    assert Cards.contains?(["Ace","Two", "Three"], "King") == false
  end
end
