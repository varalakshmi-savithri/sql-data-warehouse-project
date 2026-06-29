# Naming Conventions

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

---

## Table of Contents
- General Principles
- Table Naming Conventions
  - Bronze Rules
  - Silver Rules
  - Gold Rules
- Column Naming Conventions
  - Surrogate Keys
  - Technical Columns
- Stored Procedures

---

## General Principles
- **Naming Conventions:** Use `snake_case`, with lowercase letters and underscores (`_`) to separate words.  
- **Language:** Use English for all names.  
- **Avoid Reserved Words:** Do not use SQL reserved words as object names.  

---

## Table Naming Conventions

### Bronze Rules
- All names must start with the source system name, and table names must match their original names without renaming.  
- Pattern: `<sourcesystem>_<entity>`  
  - `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).  
  - `<entity>`: Exact table name from the source system.  
- **Example:** `crm_customer_info` → Customer information from the CRM system.  

### Silver Rules
- Same as Bronze: names start with the source system name, and table names match their original names.  
- Pattern: `<sourcesystem>_<entity>`  
- **Example:** `erp_sales
