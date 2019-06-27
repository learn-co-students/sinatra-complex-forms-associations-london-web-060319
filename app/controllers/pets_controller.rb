class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(params[:pet])
    if !params[:owner][:name].empty?
      new_owner = Owner.create(name: params[:owner][:name])
      @pet.owner = new_owner
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @pets = Pet.all
    @owners = Owner.all
    erb :'pets/edit'
  end

  patch '/pets/:id' do 
    pet = Pet.find(params[:id])
    pet.name = params[:pet][:name]
    pet.save
    owner = Owner.all.find(params[:owner][:id])
    owner.pets << pet
    owner1 = Owner.all.find(params[:id])
    owner1.update(name: params[:owner][:name])
    redirect to "pets/#{@pet.id}"
  end
end