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

describe "Post#geo_point" do

  before(:all) do
    ActiveRecord::Migration.class_eval do
      create_table :posts do |t|
        t.geo_point :point
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
    let(:point) { [1.2222, 4.2222] }
    let(:post) do 
      Post.create!(point: point)
    end

    context 'create' do

      it 'should store and return an Array' do
        p = Post.find(post.id)
        p.point.should be_a Array
        p.point.should eq point
      end

    end

    context '#update' do
      it 'should update and existing geo_point value' do
        post = Post.create!(point: point)
        refresh_posts
        new_point = [2.33333, 5.221121]
        post.update_attributes!(point: new_point)
        refresh_posts
        post.reload
        post.point.should eq new_point
      end
    end

  end

end