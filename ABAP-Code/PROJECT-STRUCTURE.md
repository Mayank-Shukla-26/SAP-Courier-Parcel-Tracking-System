# Project Structure

## Project Name
SAP-Based Courier & Parcel Delivery Tracking System

## ABAP Programs

- `ZMAYANK_PARCEL_MP` — Main application for parcel booking and status updates.
- `ZMAYANK_PARCEL_ALV` — Displays parcel tracking information in an ALV report.
- `ZMAYANK_COURIER_PRINT` — Generates courier delivery receipts using a Smart Form.

## Custom Database Tables

- `ZMAYANK_CUSTOMER` — Stores customer information.
- `ZMAYANK_CRAGENT` — Stores courier agent information.
- `ZMAYANK_PARCEL` — Stores parcel details, service type, status, and delivery charge.
- `ZMAYANK_STATLOG` — Stores parcel status log information.

## Smart Form

- `Z_MAYANK_COURIER_FORM` — Generates the courier delivery receipt.

## Transaction Code

- `ZMY_COURIER` — Opens the main courier tracking application.

## Package

`Z_MAYANK_COURIER_TRACKING_PROJ`

*Note: This document describes the project's structure. The ABAP source files and SAP Dictionary objects are maintained in the SAP development system.*
