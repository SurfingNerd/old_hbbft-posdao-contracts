---
id: interfaces_IMetadataRegistry
title: IMetadataRegistry
---

<div class="contract-doc"><div class="contract"><h2 class="contract-header"><span class="contract-kind">interface</span> IMetadataRegistry</h2><div class="source">Source: <a href="https://github.com/poanetwork/posdao-contracts/blob/v0.1.0/contracts/interfaces/IMetadataRegistry.sol" target="_blank">contracts/interfaces/IMetadataRegistry.sol</a></div></div><div class="index"><h2>Index</h2><ul><li><a href="interfaces_IMetadataRegistry.html#DataChanged">DataChanged</a></li><li><a href="interfaces_IMetadataRegistry.html#getAddress">getAddress</a></li><li><a href="interfaces_IMetadataRegistry.html#getData">getData</a></li><li><a href="interfaces_IMetadataRegistry.html#getUint">getUint</a></li></ul></div><div class="reference"><h2>Reference</h2><div class="events"><h3>Events</h3><ul><li><div class="item event"><span id="DataChanged" class="anchor-marker"></span><h4 class="name">DataChanged</h4><div class="body"><code class="signature">event <strong>DataChanged</strong><span>(bytes32 name, string key, string plainKey) </span></code><hr/><dl><dt><span class="label-parameters">Parameters:</span></dt><dd><div><code>name</code> - bytes32</div><div><code>key</code> - string</div><div><code>plainKey</code> - string</div></dd></dl></div></div></li></ul></div><div class="functions"><h3>Functions</h3><ul><li><div class="item function"><span id="getAddress" class="anchor-marker"></span><h4 class="name">getAddress</h4><div class="body"><code class="signature"><span>abstract </span>function <strong>getAddress</strong><span>(bytes32 _name, string _key) </span><span>external </span><span>view </span><span>returns  (address) </span></code><hr/><dl><dt><span class="label-parameters">Parameters:</span></dt><dd><div><code>_name</code> - bytes32</div><div><code>_key</code> - string</div></dd><dt><span class="label-return">Returns:</span></dt><dd>address</dd></dl></div></div></li><li><div class="item function"><span id="getData" class="anchor-marker"></span><h4 class="name">getData</h4><div class="body"><code class="signature"><span>abstract </span>function <strong>getData</strong><span>(bytes32 _name, string _key) </span><span>external </span><span>view </span><span>returns  (bytes32) </span></code><hr/><dl><dt><span class="label-parameters">Parameters:</span></dt><dd><div><code>_name</code> - bytes32</div><div><code>_key</code> - string</div></dd><dt><span class="label-return">Returns:</span></dt><dd>bytes32</dd></dl></div></div></li><li><div class="item function"><span id="getUint" class="anchor-marker"></span><h4 class="name">getUint</h4><div class="body"><code class="signature"><span>abstract </span>function <strong>getUint</strong><span>(bytes32 _name, string _key) </span><span>external </span><span>view </span><span>returns  (uint) </span></code><hr/><dl><dt><span class="label-parameters">Parameters:</span></dt><dd><div><code>_name</code> - bytes32</div><div><code>_key</code> - string</div></dd><dt><span class="label-return">Returns:</span></dt><dd>uint</dd></dl></div></div></li></ul></div></div></div>