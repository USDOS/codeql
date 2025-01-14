import csharp
import semmle.code.csharp.commons.Diagnostics

query predicate compilationInfo(string key, float value) {
  key != "Resolved references" and
  exists(Compilation c, string infoKey, string infoValue | infoValue = c.getInfo(infoKey) |
    key = infoKey and
    value = infoValue.toFloat()
    or
    not exists(infoValue.toFloat()) and
    key = infoKey + ": " + infoValue and
    value = 1
  )
}
