*&---------------------------------------------------------------------*
*& Report ZMAYANK_COURIER_PRINT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmayank_courier_print.

PARAMETERS p_parcel TYPE char10.

DATA:
      lv_fm_name TYPE rs38l_fnam.

START-OF-SELECTION.

"Get generated function module name of Smart Form
CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
EXPORTING
  formname = 'Z_MAYANK_COURIER_FORM'
IMPORTING
  fm_name  = lv_fm_name
EXCEPTIONS
  no_form            = 1
  no_function_module = 2
  OTHERS             = 3.

IF sy-subrc <> 0.
  MESSAGE 'Smart Form function module not found' TYPE 'E'.
ENDIF.

"Call Smart Form
CALL FUNCTION lv_fm_name
EXPORTING
  iv_parcel_id = p_parcel
EXCEPTIONS
  formatting_error = 1
  internal_error   = 2
  send_error       = 3
  user_canceled    = 4
  OTHERS           = 5.

IF sy-subrc = 0.
  MESSAGE 'Courier receipt generated successfully' TYPE 'S'.
ELSE.
  MESSAGE 'Error while generating courier receipt' TYPE 'E'.
ENDIF.
