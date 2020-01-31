# 2.0.1
* Fix Parser.new(...) to properly load content from file.
* Prevent BigDecimal.new deprecation warning.

# 2.0.0
* Allow loading content from a string as well as from a file.
* Introduce new public interface for parsing and loading, eg. Paxmex.epraw.parse(...).
* Upgrade to rspec 3.0.

# 1.2.1
* General cleanup
* Fixed issue with numeric fields containing float values.

# 1.2.0
* Add support for the CBNOT (chargeback note) report.

# 1.1.1
* Fix index range for ASSET_BILLING_DESCRIPTION in EPTRN files.
