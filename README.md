# SAP-Based Courier & Parcel Delivery Tracking System

A SAP ABAP-based courier and parcel delivery management system developed using classic SAP GUI technologies.

## 📌 Project Overview

This project manages the complete parcel booking and tracking process. It allows users to book parcels, calculate delivery charges, update parcel status, track status history, generate ALV reports, and print courier delivery receipts.

## 🛠️ Technologies Used

- SAP ABAP
- Module Pool Programming
- ABAP Dictionary (DDIC)
- ALV Reports
- Smart Forms
- Open SQL
- Custom Database Tables
- SAP GUI

## ✨ Key Features

- Customer and delivery agent management
- Parcel booking through Module Pool screens
- Automatic Parcel ID generation
- Delivery charge calculation based on weight, distance, and service type
- Parcel status management
- Status update and cancellation
- Complete parcel status audit trail
- ALV-based parcel tracking report
- Filtering by Parcel ID, Agent, Status, and Service Type
- Smart Form-based courier delivery receipt
- Database validation for customers and delivery agents

## 🗄️ Database Tables

| Table | Purpose |
|---|---|
| `ZMAYANK_CUSTOMER` | Stores customer information |
| `ZMAYANK_CRAGENT` | Stores delivery agent information |
| `ZMAYANK_PARCEL` | Stores parcel and delivery information |
| `ZMAYANK_STATLOG` | Stores parcel status history |

## 🔄 Parcel Workflow

```text
Customer
   ↓
Parcel Booking
   ↓
Delivery Charge Calculation
   ↓
BOOKED
   ↓
TRANSIT
   ↓
DELIVERED / CANCELLED
   ↓
Status Audit Log
   ↓
ALV Tracking Report
   ↓
Smart Form Delivery Receipt
