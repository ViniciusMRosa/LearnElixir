defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Create Deck

  ## Examples

      iex> Cards.create_deck()

  """
  def create_deck do
    values = ["Ace", "Two", "Three","Four", "Five"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]

    for suit <- suits, value <- values do 
      "#{value} of #{suit}"
    end
  end


  @doc """
  Shuffle Deck

  ## Examples

      iex> Cards.shuffle(["Ace", "Two", "Three"])
    
  """
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  @doc """
    Verify if a deck contains a given card

    ## Examples

      iex> Cards.contains?(["Ace of Spades", "Two of Hearts", "Three of Clubs"],"Two of Hearts")
      true
      iex> Cards.contains?(["Ace of Spades", "Two of Hearts", "Three of Clubs"],"Three of Hearts")
      false
  """
  def contains?(deck, hand) do
    Enum.member?(deck, hand)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cars should be in the hand

    ## Examples

      iex> Cards.deal(["Ace of Spades", "Two of Hearts", "Three of Clubs"], 2)
      {["Ace of Spades", "Two of Hearts"], ["Three of Clubs"]}
  """
  def deal(cards, hand_size) do 
    Enum.split(cards, hand_size)
  end

  def save_deck(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do    
    case File.read(filename) do 
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "File does not exist"
    end  
  end

  def create_hand(hand_size) do
    {hand, _} = Cards.create_deck 
    |> Cards.shuffle 
    |> Cards.deal(hand_size)
    hand
  end
end
