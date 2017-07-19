
--
-- Indexes for dumped tables
--

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `block_content`
--
ALTER TABLE `block_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block_content_field__uuid__value` (`uuid`),
  ADD UNIQUE KEY `block_content__revision_id` (`revision_id`),
  ADD KEY `block_content_field__type__target_id` (`type`);

--
-- Indexes for table `block_content_field_data`
--
ALTER TABLE `block_content_field_data`
  ADD PRIMARY KEY (`id`,`langcode`),
  ADD KEY `block_content__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`),
  ADD KEY `block_content__revision_id` (`revision_id`),
  ADD KEY `block_content_field__type__target_id` (`type`),
  ADD KEY `block_content_field__revision_user__target_id` (`revision_user`);

--
-- Indexes for table `block_content_field_revision`
--
ALTER TABLE `block_content_field_revision`
  ADD PRIMARY KEY (`revision_id`,`langcode`),
  ADD KEY `block_content__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`),
  ADD KEY `block_content_field__revision_user__target_id` (`revision_user`);

--
-- Indexes for table `block_content_revision`
--
ALTER TABLE `block_content_revision`
  ADD PRIMARY KEY (`revision_id`),
  ADD KEY `block_content__id` (`id`);

--
-- Indexes for table `block_content_revision__body`
--
ALTER TABLE `block_content_revision__body`
  ADD PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `block_content__body`
--
ALTER TABLE `block_content__body`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `cachetags`
--
ALTER TABLE `cachetags`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `cache_bootstrap`
--
ALTER TABLE `cache_bootstrap`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_config`
--
ALTER TABLE `cache_config`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_container`
--
ALTER TABLE `cache_container`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_data`
--
ALTER TABLE `cache_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_default`
--
ALTER TABLE `cache_default`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_discovery`
--
ALTER TABLE `cache_discovery`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_dynamic_page_cache`
--
ALTER TABLE `cache_dynamic_page_cache`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_entity`
--
ALTER TABLE `cache_entity`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_menu`
--
ALTER TABLE `cache_menu`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_render`
--
ALTER TABLE `cache_render`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `comment_field__uuid__value` (`uuid`),
  ADD KEY `comment_field__comment_type__target_id` (`comment_type`);

--
-- Indexes for table `comment_entity_statistics`
--
ALTER TABLE `comment_entity_statistics`
  ADD PRIMARY KEY (`entity_id`,`entity_type`,`field_name`),
  ADD KEY `last_comment_timestamp` (`last_comment_timestamp`),
  ADD KEY `comment_count` (`comment_count`),
  ADD KEY `last_comment_uid` (`last_comment_uid`);

--
-- Indexes for table `comment_field_data`
--
ALTER TABLE `comment_field_data`
  ADD PRIMARY KEY (`cid`,`langcode`),
  ADD KEY `comment__id__default_langcode__langcode` (`cid`,`default_langcode`,`langcode`),
  ADD KEY `comment_field__comment_type__target_id` (`comment_type`),
  ADD KEY `comment_field__uid__target_id` (`uid`),
  ADD KEY `comment_field__created` (`created`),
  ADD KEY `comment__status_pid` (`pid`,`status`),
  ADD KEY `comment__num_new` (`entity_id`,`entity_type`,`comment_type`,`status`,`created`,`cid`,`thread`(191)),
  ADD KEY `comment__entity_langcode` (`entity_id`,`entity_type`,`comment_type`,`default_langcode`);

--
-- Indexes for table `comment__comment_body`
--
ALTER TABLE `comment__comment_body`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `comment_body_format` (`comment_body_format`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`collection`,`name`);

--
-- Indexes for table `file_managed`
--
ALTER TABLE `file_managed`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `file_field__uuid__value` (`uuid`),
  ADD KEY `file_field__uid__target_id` (`uid`),
  ADD KEY `file_field__uri` (`uri`(191)),
  ADD KEY `file_field__status` (`status`),
  ADD KEY `file_field__changed` (`changed`);

--
-- Indexes for table `file_usage`
--
ALTER TABLE `file_usage`
  ADD PRIMARY KEY (`fid`,`type`,`id`,`module`),
  ADD KEY `type_id` (`type`,`id`),
  ADD KEY `fid_count` (`fid`,`count`),
  ADD KEY `fid_module` (`fid`,`module`);

--
-- Indexes for table `flood`
--
ALTER TABLE `flood`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `allow` (`event`,`identifier`,`timestamp`),
  ADD KEY `purge` (`expiration`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`uid`,`nid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `key_value`
--
ALTER TABLE `key_value`
  ADD PRIMARY KEY (`collection`,`name`);

--
-- Indexes for table `key_value_expire`
--
ALTER TABLE `key_value_expire`
  ADD PRIMARY KEY (`collection`,`name`),
  ADD KEY `all` (`name`,`collection`,`expire`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `menu_link_content`
--
ALTER TABLE `menu_link_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_link_content_field__uuid__value` (`uuid`);

--
-- Indexes for table `menu_link_content_data`
--
ALTER TABLE `menu_link_content_data`
  ADD PRIMARY KEY (`id`,`langcode`),
  ADD KEY `menu_link_content__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`),
  ADD KEY `menu_link_content_field__link__uri` (`link__uri`(30));

--
-- Indexes for table `menu_tree`
--
ALTER TABLE `menu_tree`
  ADD PRIMARY KEY (`mlid`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  ADD KEY `menu_parent_expand_child` (`menu_name`,`expanded`,`has_children`,`parent`(16)),
  ADD KEY `route_values` (`route_name`(32),`route_param_key`(16));

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `node_field__uuid__value` (`uuid`),
  ADD UNIQUE KEY `node__vid` (`vid`),
  ADD KEY `node_field__type__target_id` (`type`);

--
-- Indexes for table `node_access`
--
ALTER TABLE `node_access`
  ADD PRIMARY KEY (`nid`,`gid`,`realm`,`langcode`);

--
-- Indexes for table `node_field_data`
--
ALTER TABLE `node_field_data`
  ADD PRIMARY KEY (`nid`,`langcode`),
  ADD KEY `node__id__default_langcode__langcode` (`nid`,`default_langcode`,`langcode`),
  ADD KEY `node__vid` (`vid`),
  ADD KEY `node_field__type__target_id` (`type`),
  ADD KEY `node_field__uid__target_id` (`uid`),
  ADD KEY `node_field__created` (`created`),
  ADD KEY `node_field__changed` (`changed`),
  ADD KEY `node__frontpage` (`promote`,`status`,`sticky`,`created`),
  ADD KEY `node__status_type` (`status`,`type`,`nid`),
  ADD KEY `node__title_type` (`title`(191),`type`(4));

--
-- Indexes for table `node_field_revision`
--
ALTER TABLE `node_field_revision`
  ADD PRIMARY KEY (`vid`,`langcode`),
  ADD KEY `node__id__default_langcode__langcode` (`nid`,`default_langcode`,`langcode`),
  ADD KEY `node_field__uid__target_id` (`uid`);

--
-- Indexes for table `node_revision`
--
ALTER TABLE `node_revision`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `node__nid` (`nid`),
  ADD KEY `node_field__langcode` (`langcode`),
  ADD KEY `node_field__revision_uid__target_id` (`revision_uid`);

--
-- Indexes for table `node_revision__body`
--
ALTER TABLE `node_revision__body`
  ADD PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `node_revision__comment`
--
ALTER TABLE `node_revision__comment`
  ADD PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`);

--
-- Indexes for table `node_revision__field_image`
--
ALTER TABLE `node_revision__field_image`
  ADD PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `field_image_target_id` (`field_image_target_id`);

--
-- Indexes for table `node_revision__field_tags`
--
ALTER TABLE `node_revision__field_tags`
  ADD PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `field_tags_target_id` (`field_tags_target_id`);

--
-- Indexes for table `node__body`
--
ALTER TABLE `node__body`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `node__comment`
--
ALTER TABLE `node__comment`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`);

--
-- Indexes for table `node__field_image`
--
ALTER TABLE `node__field_image`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `field_image_target_id` (`field_image_target_id`);

--
-- Indexes for table `node__field_tags`
--
ALTER TABLE `node__field_tags`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `field_tags_target_id` (`field_tags_target_id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `name_created` (`name`,`created`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `router`
--
ALTER TABLE `router`
  ADD PRIMARY KEY (`name`),
  ADD KEY `pattern_outline_parts` (`pattern_outline`(191),`number_parts`);

--
-- Indexes for table `search_dataset`
--
ALTER TABLE `search_dataset`
  ADD PRIMARY KEY (`sid`,`langcode`,`type`);

--
-- Indexes for table `search_index`
--
ALTER TABLE `search_index`
  ADD PRIMARY KEY (`word`,`sid`,`langcode`,`type`),
  ADD KEY `sid_type` (`sid`,`langcode`,`type`);

--
-- Indexes for table `search_total`
--
ALTER TABLE `search_total`
  ADD PRIMARY KEY (`word`);

--
-- Indexes for table `semaphore`
--
ALTER TABLE `semaphore`
  ADD PRIMARY KEY (`name`),
  ADD KEY `value` (`value`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `shortcut`
--
ALTER TABLE `shortcut`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shortcut_field__uuid__value` (`uuid`),
  ADD KEY `shortcut_field__shortcut_set__target_id` (`shortcut_set`);

--
-- Indexes for table `shortcut_field_data`
--
ALTER TABLE `shortcut_field_data`
  ADD PRIMARY KEY (`id`,`langcode`),
  ADD KEY `shortcut__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`),
  ADD KEY `shortcut_field__shortcut_set__target_id` (`shortcut_set`),
  ADD KEY `shortcut_field__link__uri` (`link__uri`(30));

--
-- Indexes for table `shortcut_set_users`
--
ALTER TABLE `shortcut_set_users`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `set_name` (`set_name`);

--
-- Indexes for table `taxonomy_index`
--
ALTER TABLE `taxonomy_index`
  ADD PRIMARY KEY (`nid`,`tid`),
  ADD KEY `term_node` (`tid`,`status`,`sticky`,`created`);

--
-- Indexes for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
  ADD PRIMARY KEY (`tid`),
  ADD UNIQUE KEY `taxonomy_term_field__uuid__value` (`uuid`),
  ADD KEY `taxonomy_term_field__vid__target_id` (`vid`);

--
-- Indexes for table `taxonomy_term_field_data`
--
ALTER TABLE `taxonomy_term_field_data`
  ADD PRIMARY KEY (`tid`,`langcode`),
  ADD KEY `taxonomy_term__id__default_langcode__langcode` (`tid`,`default_langcode`,`langcode`),
  ADD KEY `taxonomy_term_field__name` (`name`(191)),
  ADD KEY `taxonomy_term__tree` (`vid`,`weight`,`name`(191)),
  ADD KEY `taxonomy_term__vid_name` (`vid`,`name`(191));

--
-- Indexes for table `taxonomy_term_hierarchy`
--
ALTER TABLE `taxonomy_term_hierarchy`
  ADD PRIMARY KEY (`tid`,`parent`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `alias_langcode_pid` (`alias`(191),`langcode`,`pid`),
  ADD KEY `source_langcode_pid` (`source`(191),`langcode`,`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `user_field__uuid__value` (`uuid`);

--
-- Indexes for table `users_data`
--
ALTER TABLE `users_data`
  ADD PRIMARY KEY (`uid`,`module`,`name`),
  ADD KEY `module` (`module`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `users_field_data`
--
ALTER TABLE `users_field_data`
  ADD PRIMARY KEY (`uid`,`langcode`),
  ADD UNIQUE KEY `user__name` (`name`,`langcode`),
  ADD KEY `user__id__default_langcode__langcode` (`uid`,`default_langcode`,`langcode`),
  ADD KEY `user_field__mail` (`mail`(191)),
  ADD KEY `user_field__created` (`created`),
  ADD KEY `user_field__access` (`access`);

--
-- Indexes for table `user__roles`
--
ALTER TABLE `user__roles`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `roles_target_id` (`roles_target_id`);

--
-- Indexes for table `user__user_picture`
--
ALTER TABLE `user__user_picture`
  ADD PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `user_picture_target_id` (`user_picture_target_id`);

--
-- Indexes for table `watchdog`
--
ALTER TABLE `watchdog`
  ADD PRIMARY KEY (`wid`),
  ADD KEY `type` (`type`),
  ADD KEY `uid` (`uid`),
  ADD KEY `severity` (`severity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block_content`
--
ALTER TABLE `block_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `block_content_revision`
--
ALTER TABLE `block_content_revision`
  MODIFY `revision_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_managed`
--
ALTER TABLE `file_managed`
  MODIFY `fid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `flood`
--
ALTER TABLE `flood`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.';
--
-- AUTO_INCREMENT for table `menu_link_content`
--
ALTER TABLE `menu_link_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_tree`
--
ALTER TABLE `menu_tree`
  MODIFY `mlid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.', AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `nid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `node_revision`
--
ALTER TABLE `node_revision`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.';
--
-- AUTO_INCREMENT for table `sequences`
--
ALTER TABLE `sequences`
  MODIFY `value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `shortcut`
--
ALTER TABLE `shortcut`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.';
--
-- AUTO_INCREMENT for table `watchdog`
--
ALTER TABLE `watchdog`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.', AUTO_INCREMENT=372;