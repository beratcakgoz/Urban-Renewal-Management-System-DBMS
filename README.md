# Urban Renewal Database Management System

## Overview
This project is a comprehensive database management system designed to manage the end-to-end urban renewal processes of buildings that are at risk of earthquakes or have reached the end of their structural lifespan on a digital platform. The system centralizes building structural details, risk reports, ownership rates, and transformation projects executed by contractor firms into a single hub.

## Core Functional Requirements
* **Basic Record Keeping:** Stores fundamental building records on a district basis, including location, construction year, and the number of floors.
* **Structural Data Logging:** Records specific engineering properties of buildings, such as soil type, foundation type, and the materials used.
* **Inspection & Risk Tracking:** Tracks official inspection reports assigned to buildings and the subsequent risk assessments generated from these evaluations.
* **Ownership Management:** Manages multiple owners within a single building along with their respective ownership rates using a junction table.
* **Project & Contractor Matching:** Matches transformation projects of buildings entering the demolition or reconstruction phase with the assigned contractors.

## Database Architecture
The logical database design resolves complex structures using a relational model]. 
* **1:N Relationships:** For example, a single district can contain multiple buildings, and a building may have multiple inspection reports.
* **1:1 Relationships:** Each building has only one set of structural details and one valid risk assessment.
* **M:N Relationships:** The Many-to-Many relationships between buildings and owners, as well as transformation projects and contractors, are fully normalized using the `building_owners` and `project_contractors` bridge tables.
* **Physical Constraints:** The SQL implementation includes robust constraints, such as ensuring risk scores fall strictly between 0 and 100, and validating ownership rates.

## Repository Contents
* `database_schema.sql`: Contains the physical database design (DDL) including table creations, primary/foreign key definitions, and sample data insertions (DML) for districts, owners, buildings, contractors, and reports.
* `Project_Report.pdf`: The comprehensive project documentation detailing system requirements, the Entity-Relationship (E-R) diagram, logical design, and examples of complex SQL queries.
