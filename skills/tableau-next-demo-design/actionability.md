# Actionability — Salesforce objects + SObject All MCP

Every Tableau Next demo needs a record the owner can open after the aha. Analytics without a Case, Task, or Opportunity is a report, not a demo.

## Default object map

Use standard objects unless the org is Financial Services Cloud and the story needs FinServ objects.

| Story need | Object | Required fields |
|------------|--------|-----------------|
| Who | Account | Name, Type, custom or standard external id / AccountNumber |
| Who (person) | Contact | FirstName, LastName, Email, AccountId, Phone |
| Service / fail | Case | Subject, Status, Origin, ContactId, AccountId, Description |
| Follow-up | Task | Subject, Status, Priority, WhoId (Contact), WhatId (Account or Case), ActivityDate |
| Revenue leak | Opportunity | Name, StageName, Amount, CloseDate, AccountId, Description |

Join key: store the same `customer_id` on the analytic row, Account.AccountNumber (or a dedicated External_Id__c if it exists), and in Case/Task descriptions so Concierge and CRM search agree.

## SObject All MCP

Server: `salesforce-sobject-all`  
URL: `https://api.salesforce.com/platform/mcp/v1/platform/sobject-all`

1. Discover tools (`GetDynamicTools` on that namespace).
2. If `needsAuth`, stop and have the user Connect. Do not write via a guessed REST path when the requirement is MCP.
3. Describe Account, Contact, Case, Task, Opportunity (record types, required fields, record types in the org).
4. Query existing demo records by a naming prefix (example: `FFB-`) before insert to stay idempotent.
5. Insert Account → Contact → Opportunity/Case → Task.
6. Save Ids into `OBJECT_MAP.md`.

## Idempotency

- Prefix all demo Names/Subjects (`FFB | Digital Journey | …`).
- Before create, SOQL: `WHERE Name LIKE 'FFB%'` (or the demo prefix).
- Update in place rather than duplicating on reruns.

## Fallback if MCP is down

```bash
sf data create record --sobject Account --target-org <your-org-alias> --values "Name='FFB | Priya Shah' AccountNumber='FFB-10041'"
```

Record the fallback in `OBJECT_MAP.md` so the next run retries MCP.

## What “action” means in the script

The click after Concierge is not another chart. It is:

- Open Case `{subject}` for `{contact}` — assign / comment / change status, **or**
- Open Task due `{date}` on the banker, **or**
- Open Opportunity `{name}` stuck in `{stage}` because digital originations stalled.

If the owner cannot do that in Salesforce, the demo is not actionable yet.
