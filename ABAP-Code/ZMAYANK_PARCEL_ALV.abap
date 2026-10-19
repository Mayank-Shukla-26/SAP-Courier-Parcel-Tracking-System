*&---------------------------------------------------------------------*
*& Report ZMAYANK_PARCEL_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmayank_parcel_alv.

DATA: gt_parcel TYPE TABLE OF zmayank_parcel.

DATA:
      gv_sel_parcel_id TYPE char10,
      gv_sel_agent_id  TYPE char10,
      gv_sel_status    TYPE char15,
      gv_sel_service   TYPE char3.

SELECT-OPTIONS:
  s_parcel FOR gv_sel_parcel_id,
  s_agent  FOR gv_sel_agent_id,
  s_status FOR gv_sel_status,
  s_serv   FOR gv_sel_service.


SELECT *
  FROM zmayank_parcel
  INTO TABLE @gt_parcel
  WHERE parcel_id    IN @s_parcel
    AND agent_id     IN @s_agent
    AND status       IN @s_status
    AND service_type IN @s_serv.


IF sy-subrc <> 0.
  MESSAGE 'No parcel records found for the given selection' TYPE 'I'.
  RETURN.
ENDIF.

cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(go_alv)
  CHANGING
    t_table      = gt_parcel ).

go_alv->get_functions( )->set_all( abap_true ).

go_alv->get_columns( )->set_optimize( abap_true ).

"Hide SAP client field
go_alv->get_columns( )->get_column( 'MANDT' )->set_visible( abap_false ).

"Set column headings
go_alv->get_columns( )->get_column( 'PARCEL_ID' )->set_long_text( 'Parcel ID' ).
go_alv->get_columns( )->get_column( 'CUST_ID' )->set_long_text( 'Customer ID' ).
go_alv->get_columns( )->get_column( 'AGENT_ID' )->set_long_text( 'Agent ID' ).
go_alv->get_columns( )->get_column( 'WEIGHT' )->set_long_text( 'Weight' ).
go_alv->get_columns( )->get_column( 'DISTANCE' )->set_long_text( 'Distance' ).
go_alv->get_columns( )->get_column( 'SERVICE_TYPE' )->set_long_text( 'Service Type' ).
go_alv->get_columns( )->get_column( 'STATUS' )->set_long_text( 'Parcel Status' ).
go_alv->get_columns( )->get_column( 'DELIVERY_CHARGE' )->set_long_text( 'Delivery Charge' ).

"Set column widths
go_alv->get_columns( )->get_column( 'PARCEL_ID' )->set_output_length( 12 ).
go_alv->get_columns( )->get_column( 'CUST_ID' )->set_output_length( 12 ).
go_alv->get_columns( )->get_column( 'AGENT_ID' )->set_output_length( 12 ).
go_alv->get_columns( )->get_column( 'WEIGHT' )->set_output_length( 10 ).
go_alv->get_columns( )->get_column( 'DISTANCE' )->set_output_length( 10 ).
go_alv->get_columns( )->get_column( 'SERVICE_TYPE' )->set_output_length( 14 ).
go_alv->get_columns( )->get_column( 'STATUS' )->set_output_length( 15 ).
go_alv->get_columns( )->get_column( 'DELIVERY_CHARGE' )->set_output_length( 18 ).

"Set report title
go_alv->get_display_settings( )->set_list_header(
  'Courier Parcel Tracking Report'
).

go_alv->display( ).
