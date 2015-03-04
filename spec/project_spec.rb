require File.expand_path('../../app/models/project', __FILE__)

RSpec.describe Project, "#admin" do
  context "projects need admins" do
    it "should have at least one admin user" do
      u = User.new()
      sut = Project.new(:admins => [u])
      
      expect(sut.admins.first).to.eq u
      
    end
  end
end