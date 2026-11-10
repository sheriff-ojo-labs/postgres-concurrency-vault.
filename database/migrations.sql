-- =====================================================================
-- 🐘 AI NATIVE ENGINEERING STRESS LAB: SCHEMATIC MIGRATION BLUEPRINT
-- =====================================================================

-- Clean and re-forge the transactional storage layer matrix
DROP TABLE IF EXISTS replyflow_ledger CASCADE;

CREATE TABLE replyflow_ledger (
    booking_id INT PRIMARY KEY,
    tenant_id TEXT NOT NULL,
    customer_name TEXT NOT NULL,
    status TEXT NOT NULL
);

-- Seed production-grade intermingled multi-tenant records direct to disk blocks
INSERT INTO replyflow_ledger VALUES (101, 'tenant_alpha', 'Gideon (Safari)', 'PENDING');
INSERT INTO replyflow_ledger VALUES (102, 'tenant_beta', 'Olayanju (Horizon)', 'PENDING');

-- ENABLE NATIVE KERNEL-LEVEL ROW LEVEL SECURITY POLICY FILTERS
ALTER TABLE replyflow_ledger ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS tenant_isolation_policy ON replyflow_ledger;
CREATE POLICY tenant_isolation_policy ON replyflow_ledger
    FOR ALL
    USING (tenant_id = current_setting('request.jwt.claim.tenant_id', true));

