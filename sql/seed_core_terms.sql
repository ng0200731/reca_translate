-- Seed data: Core fabric names and care instructions
-- Sources: ISO 3758, EU Regulation 1007/2011, JIS L 0217, KS K 0903, GB/T 29862

-- ============================================================
-- FABRIC NAMES
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Cotton', 'fabric', 'cotton', 'Most common natural fiber');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'es', 'Algodón', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'fr', 'Coton', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'de', 'Baumwolle', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'ko', '면', 1, 'KS_K_0903');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'zh-CN', '棉', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (1, 'ja', '綿', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Polyester', 'fabric', 'polyester', 'Most common synthetic fiber');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'es', 'Poliéster', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'fr', 'Polyester', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'de', 'Polyester', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'ko', '폴리에스테르', 1, 'KS_K_0903');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'zh-CN', '聚酯纤维', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (2, 'ja', 'ポリエステル', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Elastane', 'fabric', 'elastane', 'EU term for spandex');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'es', 'Elastano', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'fr', 'Élasthanne', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'de', 'Elastan', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'ko', '엘라스테인', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'zh-CN', '氨纶', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (3, 'ja', 'エラスタン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Spandex', 'fabric', 'spandex', 'US term for elastane');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'es', 'Espandex', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'fr', 'Élasthanne', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'de', 'Elastan', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'ko', '스판덱스', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'zh-CN', '氨纶', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (4, 'ja', 'スパンデックス', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Viscose', 'fabric', 'viscose');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'es', 'Viscosa', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'fr', 'Viscose', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'de', 'Viskose', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'ko', '비스코스', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'zh-CN', '粘胶纤维', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (5, 'ja', 'ビスコース', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Nylon', 'fabric', 'nylon');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'es', 'Nailon', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'fr', 'Nylon', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'de', 'Nylon', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'ko', '나일론', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'zh-CN', '锦纶', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (6, 'ja', 'ナイロン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Wool', 'fabric', 'wool');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'es', 'Lana', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'fr', 'Laine', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'de', 'Wolle', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'ko', '양모', 1, 'KS_K_0903');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'zh-CN', '羊毛', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (7, 'ja', 'ウール', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Silk', 'fabric', 'silk');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'es', 'Seda', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'fr', 'Soie', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'de', 'Seide', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'ko', '실크', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'zh-CN', '真丝', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (8, 'ja', 'シルク', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Linen', 'fabric', 'linen');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'es', 'Lino', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'fr', 'Lin', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'de', 'Leinen', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'ko', '리넨', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'zh-CN', '亚麻', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (9, 'ja', 'リネン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Acrylic', 'fabric', 'acrylic');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'es', 'Acrílico', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'fr', 'Acrylique', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'de', 'Acryl', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'ko', '아크릴', 1, 'KS_K_0903');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'zh-CN', '腈纶', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (10, 'ja', 'アクリル', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Polyamide', 'fabric', 'polyamide');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'es', 'Poliamida', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'fr', 'Polyamide', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'de', 'Polyamid', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'ko', '폴리아미드', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'zh-CN', '聚酰胺', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (11, 'ja', 'ポリアミド', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Rayon', 'fabric', 'rayon');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'es', 'Rayón', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'fr', 'Rayonne', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'de', 'Rayon', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'ko', '레이온', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'zh-CN', '人造丝', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (12, 'ja', 'レーヨン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Cashmere', 'fabric', 'cashmere');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'es', 'Cachemira', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'fr', 'Cachemire', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'de', 'Kaschmir', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'ko', '캐시미어', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'zh-CN', '羊绒', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (13, 'ja', 'カシミヤ', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Denim', 'fabric', 'denim');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'es', 'Dénim', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'fr', 'Denim', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'de', 'Denim', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'ko', '데님', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'zh-CN', '牛仔布', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (14, 'ja', 'デニム', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Polyurethane', 'fabric', 'polyurethane');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'es', 'Poliuretano', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'fr', 'Polyuréthane', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'de', 'Polyurethan', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'ko', '폴리우레탄', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'zh-CN', '聚氨酯', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (15, 'ja', 'ポリウレタン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Modal', 'fabric', 'modal');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'es', 'Modal', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'fr', 'Modal', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'de', 'Modal', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'ko', '모달', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'zh-CN', '莫代尔', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (16, 'ja', 'モーダル', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Lycra', 'fabric', 'lycra', 'Brand name for elastane/spandex');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'es', 'Lycra', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'fr', 'Lycra', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'de', 'Lycra', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'ko', '라이크라', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'zh-CN', '莱卡', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (17, 'ja', 'ライクラ', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hemp', 'fabric', 'hemp');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'es', 'Cáñamo', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'fr', 'Chanvre', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'de', 'Hanf', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'ko', '험프', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'zh-CN', '大麻', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (18, 'ja', 'ヘンプ', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Jute', 'fabric', 'jute');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'es', 'Yute', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'fr', 'Jute', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'de', 'Jute', 1, 'EU_1007/2011');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'ko', '황마', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'zh-CN', '黄麻', 1, 'GB/T_29862');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (19, 'ja', 'ジュート', 1, 'industry');

-- ============================================================
-- CARE INSTRUCTIONS - WASHING
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Machine wash', 'care_instruction', 'machine wash');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'es', 'Lavar a máquina', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'fr', 'Lavage en machine', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'de', 'Maschinenwäsche', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'ko', '기계 세탁', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'zh-CN', '机洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (20, 'ja', '機械洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Machine wash cold', 'care_instruction', 'machine wash cold');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'es', 'Lavar a máquina en frío', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'fr', 'Lavage en machine à froid', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'de', 'Maschinenwäsche kalt', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'ko', '기계 세탁 냉수', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'zh-CN', '冷水机洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (21, 'ja', '冷水で機械洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Machine wash warm', 'care_instruction', 'machine wash warm');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'es', 'Lavar a máquina en tibio', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'fr', 'Lavage en machine à tiède', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'de', 'Maschinenwäsche warm', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'ko', '기계 세탁 미온수', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'zh-CN', '温水机洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (22, 'ja', '温水で機械洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Machine wash hot', 'care_instruction', 'machine wash hot');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'es', 'Lavar a máquina en caliente', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'fr', 'Lavage en machine à chaud', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'de', 'Maschinenwäsche heiß', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'ko', '기계 세탁 온수', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'zh-CN', '热水机洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (23, 'ja', '熱水で機械洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hand wash', 'care_instruction', 'hand wash');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'es', 'Lavar a mano', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'fr', 'Lavage à la main', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'de', 'Handwäsche', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'ko', '손세탁', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'zh-CN', '手洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (24, 'ja', '手洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hand wash cold', 'care_instruction', 'hand wash cold');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'es', 'Lavar a mano en frío', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'fr', 'Lavage à la main à froid', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'de', 'Handwäsche kalt', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'ko', '손세탁 냉수', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'zh-CN', '冷水手洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (25, 'ja', '冷水で手洗い', 1, 'ISO_3758');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not wash', 'care_instruction', 'do not wash');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'es', 'No lavar', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'fr', 'Ne pas laver', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'de', 'Nicht waschen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'ko', '세탁 불가', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'zh-CN', '不可水洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (26, 'ja', '洗濯不可', 1, 'JIS_L_0217');

-- ============================================================
-- CARE INSTRUCTIONS - BLEACHING
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not bleach', 'care_instruction', 'do not bleach');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'es', 'No blanquear', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'fr', 'Ne pas blanchir', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'de', 'Nicht bleichen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'ko', '표백 불가', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'zh-CN', '不可漂白', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (27, 'ja', '漂白不可', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Bleach when needed', 'care_instruction', 'bleach when needed');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'es', 'Blanquear si es necesario', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'fr', 'Blanchir si nécessaire', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'de', 'Bei Bedarf bleichen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'ko', '필요시 표백 가능', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'zh-CN', '需要时漂白', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (28, 'ja', '必要に応じて漂白可', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Non-chlorine bleach only', 'care_instruction', 'non-chlorine bleach only');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'es', 'Solo blanqueador sin cloro', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'fr', 'Blanchiment sans chlore uniquement', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'de', 'Nur nichtchlorhaltiges Bleichmittel', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'ko', '비염소 표백제만 사용', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'zh-CN', '仅限非氯漂白', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (29, 'ja', '非塩素漂白剤のみ使用可', 1, 'JIS_L_0217');

-- ============================================================
-- CARE INSTRUCTIONS - DRYING
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Tumble dry', 'care_instruction', 'tumble dry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'es', 'Secar en secadora', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'fr', 'Séchage en tambour', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'de', 'Trocknen im Wäschetrockner', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'ko', '건조기 사용', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'zh-CN', '滚筒烘干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (30, 'ja', 'タンブラー乾燥', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Tumble dry low', 'care_instruction', 'tumble dry low');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'es', 'Secar en secadora a temperatura baja', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'fr', 'Séchage en tambour à basse température', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'de', 'Trocknen im Wäschetrockner bei niedriger Temperatur', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'ko', '건조기 약하게 사용', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'zh-CN', '低温滚筒烘干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (31, 'ja', '低温でタンブラー乾燥', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Tumble dry medium', 'care_instruction', 'tumble dry medium');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'es', 'Secar en secadora a temperatura media', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'fr', 'Séchage en tambour à température moyenne', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'de', 'Trocknen im Wäschetrockner bei mittlerer Temperatur', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'ko', '건조기 중간 온도로 사용', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'zh-CN', '中温滚筒烘干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (32, 'ja', '中温でタンブラー乾燥', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Tumble dry high', 'care_instruction', 'tumble dry high');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'es', 'Secar en secadora a temperatura alta', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'fr', 'Séchage en tambour à haute température', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'de', 'Trocknen im Wäschetrockner bei hoher Temperatur', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'ko', '건조기 강하게 사용', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'zh-CN', '高温滚筒烘干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (33, 'ja', '高温でタンブラー乾燥', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not tumble dry', 'care_instruction', 'do not tumble dry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'es', 'No secar en secadora', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'fr', 'Ne pas sécher en tambour', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'de', 'Nicht im Wäschetrockner trocknen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'ko', '건조기 사용 불가', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'zh-CN', '不可滚筒烘干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (34, 'ja', 'タンブラー乾燥不可', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hang to dry', 'care_instruction', 'hang to dry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'es', 'Colgar para secar', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'fr', 'Suspendre pour sécher', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'de', 'Aufhängen zum Trocknen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'ko', '걸어서 건조', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'zh-CN', '悬挂晾干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (35, 'ja', 'つり干し', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Dry flat', 'care_instruction', 'dry flat');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'es', 'Secar en horizontal', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'fr', 'Séchage à plat', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'de', 'Liegend trocknen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'ko', '평평하게 건조', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'zh-CN', '平铺晾干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (36, 'ja', '平らにして干す', 1, 'JIS_L_0217');

-- ============================================================
-- CARE INSTRUCTIONS - IRONING
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Iron low heat', 'care_instruction', 'iron low heat');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'es', 'Planchar a baja temperatura', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'fr', 'Repasser à basse température', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'de', 'Bei niedriger Temperatur bügeln', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'ko', '낮은 온도로 다림질', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'zh-CN', '低温熨烫', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (37, 'ja', '低温でアイロン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Iron medium heat', 'care_instruction', 'iron medium heat');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'es', 'Planchar a temperatura media', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'fr', 'Repasser à température moyenne', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'de', 'Bei mittlerer Temperatur bügeln', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'ko', '중간 온도로 다림질', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'zh-CN', '中温熨烫', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (38, 'ja', '中温でアイロン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Iron high heat', 'care_instruction', 'iron high heat');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'es', 'Planchar a temperatura alta', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'fr', 'Repasser à haute température', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'de', 'Bei hoher Temperatur bügeln', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'ko', '높은 온도로 다림질', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'zh-CN', '高温熨烫', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (39, 'ja', '高温でアイロン', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not iron', 'care_instruction', 'do not iron');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'es', 'No planchar', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'fr', 'Ne pas repasser', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'de', 'Nicht bügeln', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'ko', '다림질 불가', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'zh-CN', '不可熨烫', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (40, 'ja', 'アイロン不可', 1, 'JIS_L_0217');

-- ============================================================
-- CARE INSTRUCTIONS - DRY CLEANING
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Dry clean', 'care_instruction', 'dry clean');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'es', 'Limpieza en seco', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'fr', 'Nettoyage à sec', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'de', 'Chemisch reinigen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'ko', '드라이클리닝', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'zh-CN', '干洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (41, 'ja', 'ドライクリーニング', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not dry clean', 'care_instruction', 'do not dry clean');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'es', 'No limpiar en seco', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'fr', 'Ne pas nettoyer à sec', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'de', 'Nicht chemisch reinigen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'ko', '드라이클리닝 불가', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'zh-CN', '不可干洗', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (42, 'ja', 'ドライクリーニング不可', 1, 'JIS_L_0217');

-- ============================================================
-- GARMENT PARTS
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Shell', 'garment_part', 'shell', 'Outer fabric of garment');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'es', 'Exterior', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'fr', 'Extérieur', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'de', 'Oberstoff', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'ko', '겉감', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'zh-CN', '面料', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (43, 'ja', '表地', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Lining', 'garment_part', 'lining');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'es', 'Forro', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'fr', 'Doublure', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'de', 'Futter', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'ko', '안감', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'zh-CN', '里料', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (44, 'ja', '裏地', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Fill', 'garment_part', 'fill', 'Insulation/filling material');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'es', 'Relleno', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'fr', 'Rembourrage', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'de', 'Füllung', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'ko', '솜', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'zh-CN', '填充物', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (45, 'ja', '中わた', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Pocket lining', 'garment_part', 'pocket lining');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'es', 'Forro de bolsillo', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'fr', 'Doublure de poche', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'de', 'Taschenfutter', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'ko', '주머니 안감', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'zh-CN', '口袋里料', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (46, 'ja', 'ポケット裏地', 1, 'industry');

-- ============================================================
-- GENERAL / MISC
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Exclusive of decoration', 'general', 'exclusive of decoration');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'es', 'Excluye decoración', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'fr', 'Décoration exclue', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'de', 'Ohne Dekoration', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'ko', '장식 제외', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'zh-CN', '装饰物除外', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (47, 'ja', '装飾部分を除く', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Exclusive of trim', 'general', 'exclusive of trim');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'es', 'Excluye adornos', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'fr', 'Garnitures exclues', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'de', 'Ohne Besatz', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'ko', '부자재 제외', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'zh-CN', '辅料除外', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (48, 'ja', '付属品を除く', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Wash inside out', 'care_instruction', 'wash inside out');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'es', 'Lavar al revés', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'fr', 'Laver sur l''envers', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'de', 'Auf links waschen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'ko', '뒤집어서 세탁', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'zh-CN', '反面洗涤', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (49, 'ja', '裏返して洗濯', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Wash with like colors', 'care_instruction', 'wash with like colors');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'es', 'Lavar con colores similares', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'fr', 'Laver avec des couleurs similaires', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'de', 'Mit ähnlichen Farben waschen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'ko', '비슷한 색상과 함께 세탁', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'zh-CN', '与相似颜色一起洗涤', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (50, 'ja', '同系色のものと一緒に洗濯', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not wring', 'care_instruction', 'do not wring');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'es', 'No escurrir', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'fr', 'Ne pas essorer', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'de', 'Nicht auswringen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'ko', '짜지 마시오', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'zh-CN', '不可拧干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (51, 'ja', '絞らないでください', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Remove promptly', 'care_instruction', 'remove promptly');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'es', 'Retirar de inmediato', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'fr', 'Retirer rapidement', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'de', 'Sofort herausnehmen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'ko', '즉시 꺼내기', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'zh-CN', '立即取出', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (52, 'ja', 'すぐに取り出す', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not twist', 'care_instruction', 'do not twist');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'es', 'No retorcer', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'fr', 'Ne pas tordre', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'de', 'Nicht verdrehen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'ko', '비틀지 마시오', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'zh-CN', '不可拧绞', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (53, 'ja', 'ねじらないでください', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Dry in shade', 'care_instruction', 'dry in shade');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'es', 'Secar a la sombra', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'fr', 'Sécher à l''ombre', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'de', 'Im Schatten trocknen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'ko', '그늘에서 건조', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'zh-CN', '阴凉处晾干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (54, 'ja', '日陰で干す', 1, 'JIS_L_0217');

-- ============================================================
-- GARMENT PARTS & ACCESSORIES
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en, notes) VALUES ('Belt', 'garment_part', 'belt', 'Waist belt accessory');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'es', 'Cinturón', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'fr', 'Ceinture', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'de', 'Gürtel', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'ko', '벨트', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'zh-CN', '腰带', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (55, 'ja', 'ベルト', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Collar', 'garment_part', 'collar');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'es', 'Cuello', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'fr', 'Col', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'de', 'Kragen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'ko', '칼라', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'zh-CN', '领子', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (56, 'ja', '襟', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Cuff', 'garment_part', 'cuff');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'es', 'Puño', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'fr', 'Poignet', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'de', 'Bündchen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'ko', '커프스', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'zh-CN', '袖口', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (57, 'ja', 'カフス', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hem', 'garment_part', 'hem');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'es', 'Ruedo', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'fr', 'Ourlet', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'de', 'Saum', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'ko', '단', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'zh-CN', '下摆', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (58, 'ja', '裾', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Seam', 'garment_part', 'seam');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'es', 'Costura', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'fr', 'Couture', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'de', 'Naht', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'ko', '솔기', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'zh-CN', '缝线', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (59, 'ja', '縫い目', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Zipper', 'garment_part', 'zipper');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'es', 'Cremallera', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'fr', 'Fermeture éclair', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'de', 'Reißverschluss', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'ko', '지퍼', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'zh-CN', '拉链', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (60, 'ja', 'ファスナー', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Button', 'garment_part', 'button');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'es', 'Botón', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'fr', 'Bouton', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'de', 'Knopf', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'ko', '단추', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'zh-CN', '纽扣', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (61, 'ja', 'ボタン', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Pocket', 'garment_part', 'pocket');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'es', 'Bolsillo', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'fr', 'Poche', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'de', 'Tasche', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'ko', '주머니', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'zh-CN', '口袋', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (62, 'ja', 'ポケット', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Sleeve', 'garment_part', 'sleeve');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'es', 'Manga', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'fr', 'Manche', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'de', 'Ärmel', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'ko', '소매', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'zh-CN', '袖子', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (63, 'ja', '袖', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Shoulder', 'garment_part', 'shoulder');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'es', 'Hombro', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'fr', 'Épaule', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'de', 'Schulter', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'ko', '어깨', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'zh-CN', '肩部', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (64, 'ja', '肩', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Waistband', 'garment_part', 'waistband');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'es', 'Cintura', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'fr', 'Ceinture', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'de', 'Bund', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'ko', '허리밴드', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'zh-CN', '腰头', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (65, 'ja', 'ウエストバンド', 1, 'industry');

-- ============================================================
-- GARMENT TYPES
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('T-Shirt', 'garment_part', 't-shirt');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'es', 'Camiseta', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'fr', 'T-shirt', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'de', 'T-Shirt', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'ko', '티셔츠', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'zh-CN', 'T恤', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (66, 'ja', 'Tシャツ', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Jacket', 'garment_part', 'jacket');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'es', 'Chaqueta', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'fr', 'Veste', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'de', 'Jacke', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'ko', '재킷', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'zh-CN', '夹克', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (67, 'ja', 'ジャケット', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Dress', 'garment_part', 'dress');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'es', 'Vestido', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'fr', 'Robe', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'de', 'Kleid', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'ko', '드레스', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'zh-CN', '连衣裙', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (68, 'ja', 'ドレス', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Pants', 'garment_part', 'pants');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'es', 'Pantalones', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'fr', 'Pantalon', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'de', 'Hose', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'ko', '바지', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'zh-CN', '裤子', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (69, 'ja', 'ズボン', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Skirt', 'garment_part', 'skirt');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'es', 'Falda', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'fr', 'Jupe', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'de', 'Rock', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'ko', '스커트', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'zh-CN', '裙子', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (70, 'ja', 'スカート', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Coat', 'garment_part', 'coat');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'es', 'Abrigo', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'fr', 'Manteau', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'de', 'Mantel', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'ko', '코트', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'zh-CN', '大衣', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (71, 'ja', 'コート', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Sweater', 'garment_part', 'sweater');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'es', 'Suéter', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'fr', 'Pull', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'de', 'Pullover', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'ko', '스웨터', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'zh-CN', '毛衣', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (72, 'ja', 'セーター', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Hoodie', 'garment_part', 'hoodie');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'es', 'Sudadera', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'fr', 'Sweat à capuche', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'de', 'Kapuzenpulli', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'ko', '후드티', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'zh-CN', '卫衣', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (73, 'ja', 'パーカー', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Scarf', 'garment_part', 'scarf');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'es', 'Bufanda', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'fr', 'Écharpe', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'de', 'Schal', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'ko', '스카프', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'zh-CN', '围巾', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (74, 'ja', 'マフラー', 1, 'industry');

-- ============================================================
-- ADDITIONAL CARE INSTRUCTIONS
-- ============================================================

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not wash the belt', 'care_instruction', 'do not wash the belt');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'es', 'No lavar el cinturón', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'fr', 'Ne pas laver la ceinture', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'de', 'Gürtel nicht waschen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'ko', '벨트 세탁 불가', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'zh-CN', '腰带不可水洗', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (75, 'ja', 'ベルトは洗濯不可', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Remove belt before washing', 'care_instruction', 'remove belt before washing');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'es', 'Retirar el cinturón antes de lavar', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'fr', 'Retirer la ceinture avant lavage', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'de', 'Gürtel vor dem Waschen entfernen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'ko', '세탁 전 벨트 제거', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'zh-CN', '洗涤前取下腰带', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (76, 'ja', '洗濯前にベルトを外す', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Wash separately', 'care_instruction', 'wash separately');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'es', 'Lavar por separado', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'fr', 'Laver séparément', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'de', 'Separat waschen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'ko', '단독 세탁', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'zh-CN', '单独洗涤', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (77, 'ja', '単独で洗濯', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Use mild detergent', 'care_instruction', 'use mild detergent');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'es', 'Usar detergente suave', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'fr', 'Utiliser un détergent doux', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'de', 'Mildes Waschmittel verwenden', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'ko', '중성 세제 사용', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'zh-CN', '使用中性洗涤剂', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (78, 'ja', '中性洗剤を使用', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Iron on reverse side', 'care_instruction', 'iron on reverse side');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'es', 'Planchar del revés', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'fr', 'Repasser sur l''envers', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'de', 'Auf links bügeln', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'ko', '뒤집어서 다림질', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'zh-CN', '反面熨烫', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (79, 'ja', '裏面からアイロン', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Close zippers before washing', 'care_instruction', 'close zippers before washing');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'es', 'Cerrar cremalleras antes de lavar', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'fr', 'Fermer les fermetures avant lavage', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'de', 'Reißverschlüsse vor dem Waschen schließen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'ko', '세탁 전 지퍼 닫기', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'zh-CN', '洗涤前拉上拉链', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (80, 'ja', '洗濯前にファスナーを閉じる', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not iron decorations', 'care_instruction', 'do not iron decorations');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'es', 'No planchar las decoraciones', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'fr', 'Ne pas repasser les décorations', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'de', 'Dekorationen nicht bügeln', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'ko', '장식 부분 다림질 금지', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'zh-CN', '不可熨烫装饰物', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (81, 'ja', '装飾部分はアイロン不可', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Do not wring or twist', 'care_instruction', 'do not wring or twist');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'es', 'No escurrir ni retorcer', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'fr', 'Ne pas essorer ni tordre', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'de', 'Nicht auswringen oder verdrehen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'ko', '짜거나 비틀지 마시오', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'zh-CN', '不可拧绞', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (82, 'ja', '絞ったりねじったりしないでください', 1, 'JIS_L_0217');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Reshape while damp', 'care_instruction', 'reshape while damp');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'es', 'Dar forma mientras está húmedo', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'fr', 'Remettre en forme pendant que c''est humide', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'de', 'In feuchtem Zustand in Form bringen', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'ko', '젖은 상태에서 모양 정리', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'zh-CN', '潮湿时整理形状', 1, 'industry');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (83, 'ja', '濡れている間に形を整える', 1, 'industry');

INSERT INTO terms (term_en, category, normalized_en) VALUES ('Dry flat in shade', 'care_instruction', 'dry flat in shade');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'es', 'Secar en horizontal a la sombra', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'fr', 'Sécher à plat à l''ombre', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'de', 'Liegend im Schatten trocknen', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'ko', '그늘에서 평평하게 건조', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'zh-CN', '阴凉处平铺晾干', 1, 'ISO_3758');
INSERT INTO translations (term_id, language, translation, verified, source) VALUES (84, 'ja', '日陰で平らにして干す', 1, 'JIS_L_0217');
