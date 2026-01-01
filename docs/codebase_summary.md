# Sagnus ERP Codebase Summary

## Overview

**Sagnus ERP** is a modular, Domain-Driven Design (DDD) based ERP system built with Java 21 and Maven. It emphasizes Clean Architecture, Bounded Contexts, and centralized platform services.

## Key Architectural Principles

- **Domain-Driven Design (DDD)**: Explicit Bounded Contexts (BCs) and pure domain models.
- **Clean Architecture**: Separation of concerns with `Domain`, `Application`, `Infrastructure`, and `API` layers.
- **Contracts**: Communication between BCs is strictly through `*-api` modules (contracts), avoiding direct dependencies on other BCs' implementations.
- **Platform Services**: Centralized security (`sagnus-platform-security`) and error handling (`sagnus-shared-api-error`).

## Project Structure

The project is organized as a multi-module Maven project:

### Bounded Contexts (BCs)

- **`sagnus-bc-corp`**: Corporate data (Person, Product). Source of truth for shared data.
- **`sagnus-bc-auth`**: Authentication and Authorization. Handles login and JWT.
- **`sagnus-bc-nfe`**: Fiscal domain (Electronic Invoices).
  - Structure: `api`, `application`, `domain`, `infrastructure`.

### Contracts (`*-api`)

- **`sagnus-bc-contracts-corp`**: Defines interfaces and DTOs for accessing Corporate data. Used by other BCs like AUTH and NFE.

### Platform & Shared Modules

- **`sagnus-platform-security`**: Centralized JWT security, authentication filters, and configuration.
- **`sagnus-platform-web`**: Common web infrastructure, handlers, and filters.
- **`sagnus-shared-api-error`**: Unified error handling and response format.
- **`sagnus-shared-kernel`**: Shared domain primitives and utilities.

## Technology Stack

- **Language**: Java 21
- **Build Tool**: Maven 3.9+
- **Framework**: Spring Boot 3.3.4 (used in Infrastructure/API layers, avoided in Domain)
- **Database**: PostgreSQL (planned/implied)
- **Security**: JWT (Stateless)

## Next Steps

The codebase is well-structured and documented. Ready for development tasks such as:

- Implementing new features in existing BCs.
- Adding new Bounded Contexts.
- Enhancing platform services.
