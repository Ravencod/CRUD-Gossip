class GossipController < ApplicationController
    def new
        @gossip = Gossip.new
    end
    
    def create
      @gossip = Gossip.new(params[:gossips])
      @gossip.anonymous_gossiper = params[:anonymous_gossiper]
      @gossip.content = params[:content]
      if @gossip.save
        redirect_to(gossip_path(@gossip, @show))
      end
    end

    def show
        @gossip = Gossip.find(params[:id])
    end

    def edit
        @gossip = Gossip.find(params[:id])
    end

    def update
        @gossip = Gossip.find(params[:id])
        @gossip.update(anonymous_gossiper: params[:anonymous_gossiper], content: params[:content])
        redirect_to gossip_path(@gossip)
    end

    def index
        @gossips = Gossip.all
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.delete

        redirect_to gossip_index_path
    end
end
