 ----------------------------------------------------------------------------------------------------------------
-- CREATE a user manaual
----------------------------------------------------------------------------------------------------------------
create user propalluseradmin identified by "jelszo"container = current;
grant create session to propalluseradmin;
drop user propalluseradmin;

 ----------------------------------------------------------------------------------------------------------------
-- CREATE select role for all views
----------------------------------------------------------------------------------------------------------------
create role allselect_role;
grant execute on relation_pack to allselect_role;

 ----------------------------------------------------------------------------------------------------------------
-- CREATE update role for all views
----------------------------------------------------------------------------------------------------------------
create role allupdate_role;


 ----------------------------------------------------------------------------------------------------------------
-- CREATE insert role for all views
----------------------------------------------------------------------------------------------------------------
create role allinsert_role;


 ----------------------------------------------------------------------------------------------------------------
-- CREATE delete role for all views
----------------------------------------------------------------------------------------------------------------
create role alldelete_role;

 ----------------------------------------------------------------------------------------------------------------
-- CREATE menu_role role for menu
----------------------------------------------------------------------------------------------------------------
create role menu_role;
grant execute on select_pack to menu_role;
grant select on view_mainmenu to menu_role;
grant select on view_menu_1 to menu_role;

 ----------------------------------------------------------------------------------------------------------------
-- CREATE execute role for interfaceallprivileges_pack 
----------------------------------------------------------------------------------------------------------------
create role executeinterfaceallpriv_role;
grant execute on interfaceallprivileges_pack to executeinterfaceallpriv_role;

 ----------------------------------------------------------------------------------------------------------------
-- Grant all... roles to users
----------------------------------------------------------------------------------------------------------------
grant allselect_role to propalladmin;
grant allupdate_role to propalladmin;
grant allinsert_role to propalladmin;
grant alldelete_role to propalladmin;
grant executeinterfaceallpriv_role to propalladmin;


--Grant rolews to an admin user
grant menu_role to propalluseradmin; 
grant allselect_role to propalluseradmin;

grant allupdate_role to propalluseradmin;
grant allinsert_role to propalluseradmin;
grant alldelete_role to propalluseradmin;
grant executeinterfaceallpriv_role to propalluseradmin;