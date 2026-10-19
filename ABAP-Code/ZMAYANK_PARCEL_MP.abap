*&---------------------------------------------------------------------*
*& Module Pool      ZMAYANK_PARCEL_MP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
PROGRAM ZMAYANK_PARCEL_MP.

DATA:
      gv_cust_id TYPE char10,
      gv_agent_id TYPE char10,
      gv_weight TYPE p DECIMALS 2,
      gv_distance TYPE p DECIMALS 2,
      gv_service_type TYPE char3,
      gv_status_parcel_id TYPE char10,
      gv_new_status TYPE char15.

INCLUDE zmayank_parcel_mp_user_commi01.

INCLUDE zmayank_parcel_mp_user_commi02.

INCLUDE zmayank_parcel_mp_user_commi03.
