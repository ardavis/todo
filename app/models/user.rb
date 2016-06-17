class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :settings

  after_create :set_default_settings

  def method_missing(method)
    setting = self.settings.find_by(name: method)

    if setting
      setting.value.send(setting.conversion)
    else
      super
    end
  end

  private

  def set_default_settings
    data = [
        [:to_dont_time, 7, :to_i],
        [:other_setting, 'test', :to_s]
    ]

    data.each do |name, value, conversion|
      self.settings.create(name: name, value: value, conversion: conversion)
    end

  end
end
