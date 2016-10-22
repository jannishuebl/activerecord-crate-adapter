# -*- coding: utf-8; -*-
#
# Licensed to CRATE Technology GmbH ("Crate") under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  Crate licenses
# this file to you under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.  You may
# obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
# However, if you have executed another commercial license agreement
# with Crate these terms will supersede the license and you may use the
# software solely pursuant to the terms of the relevant commercial agreement.

require_relative '../spec_helper'

describe "Post#date_time" do

  before(:all) do
    ActiveRecord::Migration.class_eval do
      create_table :posts do |t|
        t.datetime :time
      end
    end
    Post.reset_column_information
  end

  after(:all) do
    ActiveRecord::Migration.class_eval do
      drop_table :posts
    end
  end


  describe "#array column type" do
    let(:time) { Time.now }
    let(:post) do 
      Post.create!(time: time)
    end

    context 'create' do

      context 'time is date' do
        let(:time) { Date.today }
        let(:date_in_time) { time.to_time}

        it 'should store and return an Time' do
          p = Post.find(post.id)
          p.time.should be_a Time
          p.time.to_i.should eq date_in_time.to_i
        end
      end

      it 'should store and return an Time' do
        p = Post.find(post.id)
        p.time.should be_a Time
        p.time.to_i.should eq time.to_i
      end

      it 'should find the post by time value' do
        post = Post.create!(time: time)
        refresh_posts
        Post.where(time: time).should include(post)
      end
    end

    context '#update' do
      it 'should update and existing time value' do
        post = Post.create!(time: time)
        refresh_posts
        new_time = time + 1.hour
        post.update_attributes!(time: new_time)
        refresh_posts
        post.reload
        post.time.to_i.should eq new_time.to_i
      end
    end

  end

end