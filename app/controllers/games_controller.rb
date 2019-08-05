require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join(" ")
  end

  def score
    # recuperer les lettes
    @letters = params[:letters].split(" ")
    # recuperer la query
    @word = params[:word]
    # si la query contient des lettres absentes, alors perdu
    # sinon faire appel a l'API
   url = "https://wagon-dictionary.herokuapp.com/#{@word}"
   dictionary = open(url).read
   @check_word = JSON.parse(dictionary)
    # a) si le mot utilise des lettres mais retourne false,
    #    alors le mot n'est pas anglais
    # b) si la requete retourne true, alors le user a gagne
  end
end
